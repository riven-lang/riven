open Ast.Ast_types

type literal =
  | Pliteral_integer of int
  | Pliteral_string of string
  | Pliteral_bool of bool

type identifier =
  { name : Ident.t
  ; loc : Location.t
  }

type path =
  { segments : identifier list
  ; loc : Location.t
  }

type ty =
  { kind : ty_kind
  ; loc : Location.t
  }

and ty_kind = TypePath of path

type expression =
  { kind : expr_kind
  ; loc : Location.t
  }

and expr_kind =
  | Pexpr_literal of literal
  | Pexpr_path of path
  | Pexpr_block of block
  | Pexpr_binary of expression * bin_op * expression
  | Pexpr_unary of un_op * expression
  | Pexpr_paren of expression
  | Pexpr_tuple of expression list

and block =
  { stmts : statement list option
  ; loc : Location.t
  }

and statement =
  { kind : stmt_kind
  ; loc : Location.t
  }

and stmt_kind =
  | Pstmt_expr of expression
  | Pstmt_semi of expression
  | Pstmt_item of item
  | Pstmt_empty

and item =
  { kind : item_kind
  ; loc : Location.t
  }

and item_kind = Pitem_function of identifier * param list * ty option * block

and param =
  { name : identifier
  ; ty : ty
  ; loc : Location.t
  }

type file =
  { items : item list
  ; loc : Location.t
  }
