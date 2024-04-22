%{
    [@@@coverage exclude_file]
    open Parse_tree
    open Ast.Ast_types

    let make_loc (startpos, endpos) = {
      Location.start_pos = startpos;
      Location.end_pos = endpos;
    }

    let make_ty loc kind : ty = {
        kind = kind;
        loc = make_loc loc
    }

    let make_id loc name : identifier = {
        name = name;
        loc = make_loc loc
    }

    let make_path loc ids : path = {
        segments = ids;
        loc = make_loc loc
    }

    let make_item loc kind : item = {
      kind = kind;
      loc = make_loc loc
    }

    let make_expression loc d : expression = {
      kind = d;
      loc = make_loc loc
    }

    let make_block loc stmts : block = {
        stmts = stmts;
        loc = make_loc loc
    }

    let make_statement loc d : statement = {
      kind = d;
      loc = make_loc loc
    }

    let make_param loc name ty : param = {
      name = name;
      ty = ty;
      loc = make_loc loc
    }

    let make_file loc items : file = {
        items = items;
        loc = make_loc loc
    }


%}

%token <int> INT "42"
%token  <string> ID "ID"
%token LPAREN "("
%token RPAREN ")"
%token LBRACE "{"
%token RBRACE "}"
%token LBRACK
%token RBRACK
%token AMPERSAND
%token AMPERAMPER
%token DOT
%token DOTDOTDOT
%token BAR
%token BARBAR
%token COLON
%token COLONCOLON
%token SEMICOLON
%token EQUAL
%token EQUALEQUAL
%token BANGEQUAL
%token PLUS
%token MINUS
%token DIVIDE
%token STAR
%token PERCENT
%token RANGLE
%token LANGLE
%token GREATEREQUAL
%token LESSEQUAL
%token COMMA
%token RARROW
%token BANG
%token TRUE
%token FALSE
%token STRUCT
%token PUB
%token FN
%token IF
%token ELSE
%token LOOP
%token ENUM
%token LET
%token CONST
%token SELF
%token <string> STRING
%token <char> CHAR
%token EOF

%nonassoc ID
%right EQUAL
%left BARBAR
%left AMPERAMPER
%left EQUALEQUAL BANGEQUAL
%left LANGLE RANGLE GREATEREQUAL LESSEQUAL
%left PLUS MINUS
%left STAR DIVIDE PERCENT
%nonassoc BANG
%nonassoc LBRACE LBRACK LPAREN DOT
%nonassoc prec_unary_minus

%start file

%type <Parse_tree.file> file

%type <item> item

%type <item_kind> fn
%type <ty> fn_return_type

%type <param> param
%type <param list> params

%type <ty> ty

%type <block> block

%type <statement> statement
%type <statement list> statements
%type <statement list> block_stmts

%type <expression> expression
%type <expression> expression_without_block
%type <expression> path_expression
%type <expression> binary_expression(expression)
%type <expression list> tuple_inner_expressions
%type <expression> tuple_expression



%type <literal> literal
%type <bin_op> bin_op

%type <path> path
%type <identifier list> path_segments
%type <identifier> identifier

%%

file:
| item* EOF { make_file $loc $1 }

// Items

item:
| fn { make_item $loc $1 }

fn:
| FN identifier params fn_return_type? block { Pitem_function($2, $3, $4, $5) }

fn_return_type:
| RARROW ty { $2 }


// Statements and expressions

statement:
| item { make_statement $loc (Pstmt_item($1))  }
| block_expression { make_statement $loc (Pstmt_expr($1)) }
| expression_without_block SEMICOLON { make_statement $loc (Pstmt_semi($1)) }
| SEMICOLON { make_statement $loc (Pstmt_empty) }

statements:
| statement { [$1] }
| statements statement { $1 @ [$2] }

block_stmts:
| statements { $1 }
| statements expression_without_block { $1 @ [make_statement $loc (Pstmt_expr($2))] }
| expression_without_block { [make_statement $loc (Pstmt_expr($1))] }

expression:
| unary_expression { $1 }
| literal_expression { $1 }
| path_expression { $1 }
| expression PLUS expression { make_expression $loc (Pexpr_binary($1, BinOpPlus, $3)) }
| expression MINUS expression { make_expression $loc (Pexpr_binary($1, BinOpMinus, $3)) }
| block_expression { $1 }
| paren_expression { $1 }
| tuple_expression { $1 }


expression_without_block:
| unary_expression { $1 }
| literal_expression { $1 }
| path_expression { $1 }
| expression_without_block bin_op expression { make_expression $loc (Pexpr_binary($1, $2, $3)) }
| paren_expression { $1 }
| tuple_expression { $1 }

literal:
| INT { Pliteral_integer($1) }
| STRING { Pliteral_string($1) }

literal_expression:
| literal { make_expression $loc (Pexpr_literal($1)) }

identifier:
| ID { make_id $loc (Ident.of_string $1) }

path_segments:
| identifier { [$1] }
| path_segments COLONCOLON identifier { $1 @ [$3] }

path:
| path_segments { make_path $loc $1 }

path_expression:
| path { make_expression $loc (Pexpr_path($1)) }

binary_expression(left):
| left bin_op expression { make_expression $loc (Pexpr_binary($1, $2, $3)) }

unary_expression:
| BANG expression { make_expression $loc (Pexpr_unary(UnOpNot, $2)) }
| MINUS expression { make_expression $loc (Pexpr_unary(UnOpNeg, $2)) }

block_expression:
| block { make_expression $loc (Pexpr_block($1)) }

tuple_inner_expressions:
| expression COMMA { [$1] }
| tuple_inner_expressions expression { $1 @ [$2] }

tuple_expression:
| LPAREN tuple_inner_expressions RPAREN { make_expression $loc (Pexpr_tuple($2)) }

paren_expression:
| LPAREN expression RPAREN { make_expression $loc (Pexpr_paren($2)) }

ty:
| path { make_ty $loc (TypePath($1)) }

param:
| identifier COLON ty { make_param $loc $1 $3 }

params:
| LPAREN separated_list(COMMA,param) RPAREN { $2 }

block:
| LBRACE block_stmts? RBRACE { make_block $loc $2 }



%inline bin_op:
| PLUS { BinOpPlus }
| MINUS { BinOpMinus }
| STAR { BinOpMultiply }
| DIVIDE { BinOpDivide }
| PERCENT { BinOpModulo }
| BANGEQUAL { BinOpNotEq }
| EQUALEQUAL { BinOpEq }
| LANGLE { BinOpLess }
| RANGLE { BinOpGreater }
| LESSEQUAL { BinOpLessEqual }
| GREATEREQUAL { BinOpGreaterEqual }
| AMPERAMPER { BinOpAnd }
| BARBAR { BinOpOr }
