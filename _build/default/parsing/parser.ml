
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TRUE
    | STRUCT
    | STRING of (
# 104 "parsing/parser.mly"
       (string)
# 17 "parsing/parser.ml"
  )
    | STAR
    | SEMICOLON
    | SELF
    | RPAREN
    | RBRACK
    | RBRACE
    | RARROW
    | RANGLE
    | PUB
    | PLUS
    | PERCENT
    | MINUS
    | LPAREN
    | LOOP
    | LET
    | LESSEQUAL
    | LBRACK
    | LBRACE
    | LANGLE
    | INT of (
# 60 "parsing/parser.mly"
       (int)
# 41 "parsing/parser.ml"
  )
    | IF
    | ID of (
# 61 "parsing/parser.mly"
        (string)
# 47 "parsing/parser.ml"
  )
    | GREATEREQUAL
    | FN
    | FALSE
    | EQUALEQUAL
    | EQUAL
    | EOF
    | ENUM
    | ELSE
    | DOTDOTDOT
    | DOT
    | DIVIDE
    | CONST
    | COMMA
    | COLONCOLON
    | COLON
    | CHAR of (
# 105 "parsing/parser.mly"
       (char)
# 67 "parsing/parser.ml"
  )
    | BARBAR
    | BAR
    | BANGEQUAL
    | BANG
    | AMPERSAND
    | AMPERAMPER
  
end

include MenhirBasics

# 1 "parsing/parser.mly"
  
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



# 139 "parsing/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_file) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: file. *)

  | MenhirState001 : (('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 001.
        Stack shape : FN.
        Start symbol: file. *)

  | MenhirState004 : ((('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_LPAREN, _menhir_box_file) _menhir_state
    (** State 004.
        Stack shape : FN identifier LPAREN.
        Start symbol: file. *)

  | MenhirState007 : (('s, _menhir_box_file) _menhir_cell1_param, _menhir_box_file) _menhir_state
    (** State 007.
        Stack shape : param.
        Start symbol: file. *)

  | MenhirState010 : (('s, _menhir_box_file) _menhir_cell1_identifier, _menhir_box_file) _menhir_state
    (** State 010.
        Stack shape : identifier.
        Start symbol: file. *)

  | MenhirState013 : (('s, _menhir_box_file) _menhir_cell1_path_segments, _menhir_box_file) _menhir_state
    (** State 013.
        Stack shape : path_segments.
        Start symbol: file. *)

  | MenhirState020 : ((('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_params, _menhir_box_file) _menhir_state
    (** State 020.
        Stack shape : FN identifier params.
        Start symbol: file. *)

  | MenhirState022 : ((('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_params _menhir_cell0_option_fn_return_type_, _menhir_box_file) _menhir_state
    (** State 022.
        Stack shape : FN identifier params option(fn_return_type).
        Start symbol: file. *)

  | MenhirState023 : (('s, _menhir_box_file) _menhir_cell1_LBRACE, _menhir_box_file) _menhir_state
    (** State 023.
        Stack shape : LBRACE.
        Start symbol: file. *)

  | MenhirState026 : (('s, _menhir_box_file) _menhir_cell1_MINUS, _menhir_box_file) _menhir_state
    (** State 026.
        Stack shape : MINUS.
        Start symbol: file. *)

  | MenhirState027 : (('s, _menhir_box_file) _menhir_cell1_LPAREN, _menhir_box_file) _menhir_state
    (** State 027.
        Stack shape : LPAREN.
        Start symbol: file. *)

  | MenhirState029 : (('s, _menhir_box_file) _menhir_cell1_BANG, _menhir_box_file) _menhir_state
    (** State 029.
        Stack shape : BANG.
        Start symbol: file. *)

  | MenhirState040 : ((('s, _menhir_box_file) _menhir_cell1_LPAREN, _menhir_box_file) _menhir_cell1_tuple_inner_expressions, _menhir_box_file) _menhir_state
    (** State 040.
        Stack shape : LPAREN tuple_inner_expressions.
        Start symbol: file. *)

  | MenhirState043 : (('s, _menhir_box_file) _menhir_cell1_expression, _menhir_box_file) _menhir_state
    (** State 043.
        Stack shape : expression.
        Start symbol: file. *)

  | MenhirState045 : (('s, _menhir_box_file) _menhir_cell1_expression _menhir_cell0_MINUS, _menhir_box_file) _menhir_state
    (** State 045.
        Stack shape : expression MINUS.
        Start symbol: file. *)

  | MenhirState053 : ((('s, _menhir_box_file) _menhir_cell1_LBRACE, _menhir_box_file) _menhir_cell1_statements, _menhir_box_file) _menhir_state
    (** State 053.
        Stack shape : LBRACE statements.
        Start symbol: file. *)

  | MenhirState061 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 061.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState064 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 064.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState066 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 066.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState068 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 068.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState070 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block _menhir_cell0_MINUS, _menhir_box_file) _menhir_state
    (** State 070.
        Stack shape : expression_without_block MINUS.
        Start symbol: file. *)

  | MenhirState072 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 072.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState074 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 074.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState076 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 076.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState078 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 078.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState080 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 080.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState082 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 082.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState084 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 084.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState086 : (('s, _menhir_box_file) _menhir_cell1_expression_without_block, _menhir_box_file) _menhir_state
    (** State 086.
        Stack shape : expression_without_block.
        Start symbol: file. *)

  | MenhirState098 : (('s, _menhir_box_file) _menhir_cell1_item, _menhir_box_file) _menhir_state
    (** State 098.
        Stack shape : item.
        Start symbol: file. *)


and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (Parse_tree.expression) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_expression_without_block = 
  | MenhirCell1_expression_without_block of 's * ('s, 'r) _menhir_state * (Parse_tree.expression) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_identifier = 
  | MenhirCell1_identifier of 's * ('s, 'r) _menhir_state * (Parse_tree.identifier) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_item = 
  | MenhirCell1_item of 's * ('s, 'r) _menhir_state * (Parse_tree.item) * Lexing.position * Lexing.position

and 's _menhir_cell0_option_fn_return_type_ = 
  | MenhirCell0_option_fn_return_type_ of 's * (Parse_tree.ty option)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Parse_tree.param)

and 's _menhir_cell0_params = 
  | MenhirCell0_params of 's * (Parse_tree.param list)

and ('s, 'r) _menhir_cell1_path_segments = 
  | MenhirCell1_path_segments of 's * ('s, 'r) _menhir_state * (Parse_tree.identifier list) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_statements = 
  | MenhirCell1_statements of 's * ('s, 'r) _menhir_state * (Parse_tree.statement list) * Lexing.position

and ('s, 'r) _menhir_cell1_tuple_inner_expressions = 
  | MenhirCell1_tuple_inner_expressions of 's * ('s, 'r) _menhir_state * (Parse_tree.expression list)

and ('s, 'r) _menhir_cell1_BANG = 
  | MenhirCell1_BANG of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_FN = 
  | MenhirCell1_FN of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_LPAREN = 
  | MenhirCell0_LPAREN of 's * Lexing.position

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_MINUS = 
  | MenhirCell0_MINUS of 's * Lexing.position

and _menhir_box_file = 
  | MenhirBox_file of (Parse_tree.file) [@@unboxed]

let _menhir_action_01 =
  fun _2 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 259 "parsing/parser.mly"
                             ( make_block _loc _2 )
# 355 "parsing/parser.ml"
     : (Parse_tree.block))

let _menhir_action_02 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 237 "parsing/parser.mly"
        ( make_expression _loc (Pexpr_block(_1)) )
# 366 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_03 =
  fun _1 ->
    (
# 186 "parsing/parser.mly"
             ( _1 )
# 374 "parsing/parser.ml"
     : (Parse_tree.statement list))

let _menhir_action_04 =
  fun _1 _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 187 "parsing/parser.mly"
                                      ( _1 @ [make_statement _loc (Pstmt_expr(_2))] )
# 385 "parsing/parser.ml"
     : (Parse_tree.statement list))

let _menhir_action_05 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 188 "parsing/parser.mly"
                           ( [make_statement _loc (Pstmt_expr(_1))] )
# 396 "parsing/parser.ml"
     : (Parse_tree.statement list))

let _menhir_action_06 =
  fun _1 ->
    (
# 191 "parsing/parser.mly"
                   ( _1 )
# 404 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_07 =
  fun _1 ->
    (
# 192 "parsing/parser.mly"
                     ( _1 )
# 412 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_08 =
  fun _1 ->
    (
# 193 "parsing/parser.mly"
                  ( _1 )
# 420 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_09 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 194 "parsing/parser.mly"
                             ( make_expression _loc (Pexpr_binary(_1, BinOpPlus, _3)) )
# 431 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_10 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 195 "parsing/parser.mly"
                              ( make_expression _loc (Pexpr_binary(_1, BinOpMinus, _3)) )
# 442 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_11 =
  fun _1 ->
    (
# 196 "parsing/parser.mly"
                   ( _1 )
# 450 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_12 =
  fun _1 ->
    (
# 197 "parsing/parser.mly"
                   ( _1 )
# 458 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_13 =
  fun _1 ->
    (
# 198 "parsing/parser.mly"
                   ( _1 )
# 466 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_14 =
  fun _1 ->
    (
# 202 "parsing/parser.mly"
                   ( _1 )
# 474 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_15 =
  fun _1 ->
    (
# 203 "parsing/parser.mly"
                     ( _1 )
# 482 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_16 =
  fun _1 ->
    (
# 204 "parsing/parser.mly"
                  ( _1 )
# 490 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_17 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 264 "parsing/parser.mly"
       ( BinOpPlus )
# 498 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 506 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_18 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 265 "parsing/parser.mly"
        ( BinOpMinus )
# 514 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 522 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_19 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 266 "parsing/parser.mly"
       ( BinOpMultiply )
# 530 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 538 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_20 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 267 "parsing/parser.mly"
         ( BinOpDivide )
# 546 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 554 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_21 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 268 "parsing/parser.mly"
          ( BinOpModulo )
# 562 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 570 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_22 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 269 "parsing/parser.mly"
            ( BinOpNotEq )
# 578 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 586 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_23 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 270 "parsing/parser.mly"
             ( BinOpEq )
# 594 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 602 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_24 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 271 "parsing/parser.mly"
         ( BinOpLess )
# 610 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 618 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_25 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 272 "parsing/parser.mly"
         ( BinOpGreater )
# 626 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 634 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_26 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 273 "parsing/parser.mly"
            ( BinOpLessEqual )
# 642 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 650 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_27 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 274 "parsing/parser.mly"
               ( BinOpGreaterEqual )
# 658 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 666 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_28 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 275 "parsing/parser.mly"
             ( BinOpAnd )
# 674 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 682 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_29 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _2 = 
# 276 "parsing/parser.mly"
         ( BinOpOr )
# 690 "parsing/parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 205 "parsing/parser.mly"
                                             ( make_expression _loc (Pexpr_binary(_1, _2, _3)) )
# 698 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_30 =
  fun _1 ->
    (
# 206 "parsing/parser.mly"
                   ( _1 )
# 706 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_31 =
  fun _1 ->
    (
# 207 "parsing/parser.mly"
                   ( _1 )
# 714 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_32 =
  fun _1 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 159 "parsing/parser.mly"
            ( make_file _loc _1 )
# 725 "parsing/parser.ml"
     : (Parse_tree.file))

let _menhir_action_33 =
  fun _2 _3 _4 _5 ->
    (
# 167 "parsing/parser.mly"
                                             ( Pitem_function(_2, _3, _4, _5) )
# 733 "parsing/parser.ml"
     : (Parse_tree.item_kind))

let _menhir_action_34 =
  fun _2 ->
    (
# 170 "parsing/parser.mly"
            ( _2 )
# 741 "parsing/parser.ml"
     : (Parse_tree.ty))

let _menhir_action_35 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 217 "parsing/parser.mly"
     ( make_id _loc (Ident.of_string _1) )
# 752 "parsing/parser.ml"
     : (Parse_tree.identifier))

let _menhir_action_36 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 164 "parsing/parser.mly"
     ( make_item _loc _1 )
# 763 "parsing/parser.ml"
     : (Parse_tree.item))

let _menhir_action_37 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 771 "parsing/parser.ml"
     : (Parse_tree.item list))

let _menhir_action_38 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 779 "parsing/parser.ml"
     : (Parse_tree.item list))

let _menhir_action_39 =
  fun _1 ->
    (
# 210 "parsing/parser.mly"
      ( Pliteral_integer(_1) )
# 787 "parsing/parser.ml"
     : (Parse_tree.literal))

let _menhir_action_40 =
  fun _1 ->
    (
# 211 "parsing/parser.mly"
         ( Pliteral_string(_1) )
# 795 "parsing/parser.ml"
     : (Parse_tree.literal))

let _menhir_action_41 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 214 "parsing/parser.mly"
          ( make_expression _loc (Pexpr_literal(_1)) )
# 806 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_42 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 814 "parsing/parser.ml"
     : (Parse_tree.param list))

let _menhir_action_43 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 822 "parsing/parser.ml"
     : (Parse_tree.param list))

let _menhir_action_44 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 830 "parsing/parser.ml"
     : (Parse_tree.statement list option))

let _menhir_action_45 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 838 "parsing/parser.ml"
     : (Parse_tree.statement list option))

let _menhir_action_46 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 846 "parsing/parser.ml"
     : (Parse_tree.ty option))

let _menhir_action_47 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 854 "parsing/parser.ml"
     : (Parse_tree.ty option))

let _menhir_action_48 =
  fun _1 _3 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 253 "parsing/parser.mly"
                      ( make_param _loc _1 _3 )
# 865 "parsing/parser.ml"
     : (Parse_tree.param))

let _menhir_action_49 =
  fun xs ->
    let _2 = 
# 241 "<standard.mly>"
    ( xs )
# 873 "parsing/parser.ml"
     in
    (
# 256 "parsing/parser.mly"
                                            ( _2 )
# 878 "parsing/parser.ml"
     : (Parse_tree.param list))

let _menhir_action_50 =
  fun _2 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 247 "parsing/parser.mly"
                           ( make_expression _loc (Pexpr_paren(_2)) )
# 889 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_51 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 224 "parsing/parser.mly"
                ( make_path _loc _1 )
# 900 "parsing/parser.ml"
     : (Parse_tree.path))

let _menhir_action_52 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 227 "parsing/parser.mly"
       ( make_expression _loc (Pexpr_path(_1)) )
# 911 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_53 =
  fun _1 ->
    (
# 220 "parsing/parser.mly"
             ( [_1] )
# 919 "parsing/parser.ml"
     : (Parse_tree.identifier list))

let _menhir_action_54 =
  fun _1 _3 ->
    (
# 221 "parsing/parser.mly"
                                      ( _1 @ [_3] )
# 927 "parsing/parser.ml"
     : (Parse_tree.identifier list))

let _menhir_action_55 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 935 "parsing/parser.ml"
     : (Parse_tree.param list))

let _menhir_action_56 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 943 "parsing/parser.ml"
     : (Parse_tree.param list))

let _menhir_action_57 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 176 "parsing/parser.mly"
       ( make_statement _loc (Pstmt_item(_1))  )
# 954 "parsing/parser.ml"
     : (Parse_tree.statement))

let _menhir_action_58 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 177 "parsing/parser.mly"
                   ( make_statement _loc (Pstmt_expr(_1)) )
# 965 "parsing/parser.ml"
     : (Parse_tree.statement))

let _menhir_action_59 =
  fun _1 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 178 "parsing/parser.mly"
                                     ( make_statement _loc (Pstmt_semi(_1)) )
# 976 "parsing/parser.ml"
     : (Parse_tree.statement))

let _menhir_action_60 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 179 "parsing/parser.mly"
            ( make_statement _loc (Pstmt_empty) )
# 987 "parsing/parser.ml"
     : (Parse_tree.statement))

let _menhir_action_61 =
  fun _1 ->
    (
# 182 "parsing/parser.mly"
            ( [_1] )
# 995 "parsing/parser.ml"
     : (Parse_tree.statement list))

let _menhir_action_62 =
  fun _1 _2 ->
    (
# 183 "parsing/parser.mly"
                       ( _1 @ [_2] )
# 1003 "parsing/parser.ml"
     : (Parse_tree.statement list))

let _menhir_action_63 =
  fun _2 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 244 "parsing/parser.mly"
                                        ( make_expression _loc (Pexpr_tuple(_2)) )
# 1014 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_64 =
  fun _1 ->
    (
# 240 "parsing/parser.mly"
                   ( [_1] )
# 1022 "parsing/parser.ml"
     : (Parse_tree.expression list))

let _menhir_action_65 =
  fun _1 _2 ->
    (
# 241 "parsing/parser.mly"
                                     ( _1 @ [_2] )
# 1030 "parsing/parser.ml"
     : (Parse_tree.expression list))

let _menhir_action_66 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 250 "parsing/parser.mly"
       ( make_ty _loc (TypePath(_1)) )
# 1041 "parsing/parser.ml"
     : (Parse_tree.ty))

let _menhir_action_67 =
  fun _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 233 "parsing/parser.mly"
                  ( make_expression _loc (Pexpr_unary(UnOpNot, _2)) )
# 1052 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_action_68 =
  fun _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    let _loc = (_startpos, _endpos) in
    (
# 234 "parsing/parser.mly"
                   ( make_expression _loc (Pexpr_unary(UnOpNeg, _2)) )
# 1063 "parsing/parser.ml"
     : (Parse_tree.expression))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AMPERAMPER ->
        "AMPERAMPER"
    | AMPERSAND ->
        "AMPERSAND"
    | BANG ->
        "BANG"
    | BANGEQUAL ->
        "BANGEQUAL"
    | BAR ->
        "BAR"
    | BARBAR ->
        "BARBAR"
    | CHAR _ ->
        "CHAR"
    | COLON ->
        "COLON"
    | COLONCOLON ->
        "COLONCOLON"
    | COMMA ->
        "COMMA"
    | CONST ->
        "CONST"
    | DIVIDE ->
        "DIVIDE"
    | DOT ->
        "DOT"
    | DOTDOTDOT ->
        "DOTDOTDOT"
    | ELSE ->
        "ELSE"
    | ENUM ->
        "ENUM"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | EQUALEQUAL ->
        "EQUALEQUAL"
    | FALSE ->
        "FALSE"
    | FN ->
        "FN"
    | GREATEREQUAL ->
        "GREATEREQUAL"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INT _ ->
        "INT"
    | LANGLE ->
        "LANGLE"
    | LBRACE ->
        "LBRACE"
    | LBRACK ->
        "LBRACK"
    | LESSEQUAL ->
        "LESSEQUAL"
    | LET ->
        "LET"
    | LOOP ->
        "LOOP"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | PERCENT ->
        "PERCENT"
    | PLUS ->
        "PLUS"
    | PUB ->
        "PUB"
    | RANGLE ->
        "RANGLE"
    | RARROW ->
        "RARROW"
    | RBRACE ->
        "RBRACE"
    | RBRACK ->
        "RBRACK"
    | RPAREN ->
        "RPAREN"
    | SELF ->
        "SELF"
    | SEMICOLON ->
        "SEMICOLON"
    | STAR ->
        "STAR"
    | STRING _ ->
        "STRING"
    | STRUCT ->
        "STRUCT"
    | TRUE ->
        "TRUE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_096 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _startpos _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let (_startpos__1_, _1, _endpos__2_) = (_startpos, _v, _endpos) in
      let _v = _menhir_action_32 _1 _endpos__2_ _startpos__1_ in
      MenhirBox_file _v
  
  let rec _menhir_run_099 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_item -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _v ->
      let MenhirCell1_item (_menhir_stack, _menhir_s, x, _startpos_x_, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_38 x xs in
      _menhir_goto_list_item_ _menhir_stack _menhir_lexbuf _startpos_x_ _v _menhir_s
  
  and _menhir_goto_list_item_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _startpos _v _menhir_s ->
      match _menhir_s with
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _v
      | MenhirState000 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _startpos _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState001 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_35 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_identifier : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState020 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState004 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_53 _1 in
      _menhir_goto_path_segments _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_path_segments : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COLONCOLON ->
          let _menhir_stack = MenhirCell1_path_segments (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState013 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AMPERAMPER | BANG | BANGEQUAL | BARBAR | COMMA | DIVIDE | EQUALEQUAL | GREATEREQUAL | ID _ | INT _ | LANGLE | LBRACE | LESSEQUAL | LPAREN | MINUS | PERCENT | PLUS | RANGLE | RBRACE | RPAREN | SEMICOLON | STAR | STRING _ ->
          let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_51 _1 _endpos__1_ _startpos__1_ in
          _menhir_goto_path _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_path : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState020 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_52 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_path_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_path_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_16 _1 in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_expression_without_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RANGLE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PERCENT ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LESSEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LANGLE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATEREQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BARBAR ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BANGEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACE ->
          let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_05 _1 _endpos__1_ _startpos__1_ in
          _menhir_goto_block_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState061 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_40 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_literal : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_41 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_literal_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_literal_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_15 _1 in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_07 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState086 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState078 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState068 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState066 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState026 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState027 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState040 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_087 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_28 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState043 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState026 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState027 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState023 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | SEMICOLON ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RBRACE ->
          let _v = _menhir_action_44 () in
          _menhir_goto_option_block_stmts_ _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_60 _endpos__1_ _startpos__1_ in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_statement : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let (_startpos__1_, _1) = (_startpos, _v) in
      let _v = _menhir_action_61 _1 in
      _menhir_goto_statements _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_statements : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState053
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | MINUS ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | LPAREN ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | LBRACE ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | INT _v_1 ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState053
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState053
      | FN ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | BANG ->
          let _menhir_stack = MenhirCell1_statements (_menhir_stack, _menhir_s, _v, _startpos) in
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | RBRACE ->
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_goto_block_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_39 _1 in
      _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_BANG (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState029 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_block_stmts : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_45 x in
      _menhir_goto_option_block_stmts_ _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_goto_option_block_stmts_ : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LBRACE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_2, _endpos__3_) = (_v, _endpos) in
      let _v = _menhir_action_01 _2 _endpos__3_ _startpos__1_ in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState022 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState023 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_094 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_params _menhir_cell0_option_fn_return_type_ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_option_fn_return_type_ (_menhir_stack, _4) = _menhir_stack in
      let MenhirCell0_params (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell1_identifier (_menhir_stack, _, _2, _, _) = _menhir_stack in
      let MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__5_, _5) = (_endpos, _v) in
      let _v = _menhir_action_33 _2 _3 _4 _5 in
      let (_endpos, _startpos) = (_endpos__5_, _startpos__1_) in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_36 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_item _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_item : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState098 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_098 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_item (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | FN ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | EOF ->
          let _v_0 = _menhir_action_37 () in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_57 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_02 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_block_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_block_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_088 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_58 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_11 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_054 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE, _menhir_box_file) _menhir_cell1_statements -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_statements (_menhir_stack, _menhir_s, _1, _startpos__1_) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_62 _1 _2 in
      _menhir_goto_statements _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_045 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_MINUS (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState045 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_22 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_29 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_20 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_079 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_23 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_27 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_24 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_26 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block _menhir_cell0_MINUS -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_MINUS (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_18 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_21 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_17 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER | BANGEQUAL | BARBAR | DIVIDE | EQUALEQUAL | GREATEREQUAL | LANGLE | LESSEQUAL | PERCENT | RANGLE | RBRACE | SEMICOLON | STAR ->
          let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_25 _1 _3 _endpos__3_ _startpos__1_ in
          _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_19 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_68 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_unary_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_unary_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_14 _1 in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_06 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_2, _endpos__3_) = (_v, _endpos_0) in
          let _v = _menhir_action_50 _2 _endpos__3_ _startpos__1_ in
          _menhir_goto_paren_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_64 _1 in
          _menhir_goto_tuple_inner_expressions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_paren_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_30 _1 in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_034 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_12 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_tuple_inner_expressions : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState040
      | RPAREN ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_2, _endpos__3_) = (_v, _endpos) in
          let _v = _menhir_action_63 _2 _endpos__3_ _startpos__1_ in
          _menhir_goto_tuple_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | MINUS ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | LPAREN ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | LBRACE ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | INT _v_1 ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState040
      | ID _v_2 ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState040
      | BANG ->
          let _menhir_stack = MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _v) in
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
      | _ ->
          _eRR ()
  
  and _menhir_goto_tuple_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState066 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_31 _1 in
      _menhir_goto_expression_without_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_13 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression _menhir_cell0_MINUS -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_MINUS (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_10 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_044 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expression (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_09 _1 _3 _endpos__3_ _startpos__1_ in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAREN, _menhir_box_file) _menhir_cell1_tuple_inner_expressions as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BANG | ID _ | INT _ | LBRACE | LPAREN | RPAREN | STRING _ ->
          let MenhirCell1_tuple_inner_expressions (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_65 _1 _2 in
          _menhir_goto_tuple_inner_expressions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_BANG -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_BANG (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_67 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_unary_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let _endpos__2_ = _endpos in
      let _v = _menhir_action_59 _1 _endpos__2_ _startpos__1_ in
      _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_064 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState064 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState066 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState068 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_MINUS (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState070 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState072 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState074 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState076 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState078 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState080 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState082 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState084 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expression_without_block -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState086 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MINUS ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BANG ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LBRACE, _menhir_box_file) _menhir_cell1_statements as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RANGLE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PERCENT ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LESSEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LANGLE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GREATEREQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUALEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIVIDE ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BARBAR ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | BANGEQUAL ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMPERAMPER ->
          let _menhir_stack = MenhirCell1_expression_without_block (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACE ->
          let MenhirCell1_statements (_menhir_stack, _, _1, _startpos__1_) = _menhir_stack in
          let (_endpos__2_, _2) = (_endpos, _v) in
          let _v = _menhir_action_04 _1 _2 _endpos__2_ _startpos__1_ in
          _menhir_goto_block_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_08 _1 in
      _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_66 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_ty _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_ty : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState020 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState010 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_021 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_params -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _2 = _v in
      let _v = _menhir_action_34 _2 in
      let x = _v in
      let _v = _menhir_action_47 x in
      _menhir_goto_option_fn_return_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_option_fn_return_type_ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_params -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_option_fn_return_type_ (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState022
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_identifier (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_48 _1 _3 _endpos__3_ _startpos__1_ in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState007 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let x = _v in
          let _v = _menhir_action_55 x in
          _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState007 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState004 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_008 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_56 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_005 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_LPAREN -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_43 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_cell1_identifier _menhir_cell0_LPAREN -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LPAREN (_menhir_stack, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_49 xs in
      let _menhir_stack = MenhirCell0_params (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | RARROW ->
          let _menhir_s = MenhirState020 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LBRACE ->
          let _v = _menhir_action_46 () in
          _menhir_goto_option_fn_return_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_path_segments -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_path_segments (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_54 _1 _3 in
      _menhir_goto_path_segments _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState010 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_003 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LPAREN (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState004 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RPAREN ->
              let _v = _menhir_action_42 () in
              _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | FN ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _v = _menhir_action_37 () in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _endpos _v
      | _ ->
          _eRR ()
  
end

let file =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
