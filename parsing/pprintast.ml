open Core
open Ast.Ast_types
open Parse_tree

let loc_to_json (loc : Location.t) : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "Location"
    ; ( "start"
      , `Assoc
          [ "filename", `String loc.start_pos.pos_fname
          ; "line", `Int loc.start_pos.pos_lnum
          ; "position", `Int (loc.start_pos.pos_cnum - loc.start_pos.pos_bol + 1)
          ] )
    ; ( "end"
      , `Assoc
          [ "filename", `String loc.end_pos.pos_fname
          ; "line", `Int loc.end_pos.pos_lnum
          ; "position", `Int (loc.end_pos.pos_cnum - loc.end_pos.pos_bol + 1)
          ] )
    ]
;;

let identifier_to_json (identifier : identifier) : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "Identifier"
    ; "name", `String (Ident.to_string identifier.name)
    ; "loc", loc_to_json identifier.loc
    ]
;;

let path_to_json path : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "Path"
    ; "segments", `List (List.map ~f:identifier_to_json path.segments)
    ; "loc", loc_to_json path.loc
    ]
;;

let ty_to_json (ty : ty) : Yojson.Basic.t =
  let t, v =
    match ty.kind with
    | TypePath p -> "TypePath", ("path", path_to_json p)
  in
  `Assoc [ "_type", `String t; v ]
;;

let param_to_json param : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "Param"
    ; "name", identifier_to_json param.name
    ; "type", ty_to_json param.ty
    ; "loc", loc_to_json param.loc
    ]
;;

let literal_to_json (l : literal) : Yojson.Basic.t =
  let t, v =
    match l with
    | Pliteral_integer i -> "LitInt", `Int i
    | Pliteral_bool b -> "LitBool", `Bool b
    | Pliteral_string s -> "LitString", `String s
  in
  `Assoc [ "_type", `String t; "value", v ]
;;

let rec expression_to_json (e : expression) : Yojson.Basic.t =
  match e.kind with
  | Pexpr_binary (l, o, r) -> binary_expression_to_json (l, o, r) e.loc
  | Pexpr_unary (o, exp) -> unary_expression_to_json (o, exp) e.loc
  | Pexpr_literal l -> literal_expression_to_json l e.loc
  | Pexpr_path p -> path_expression_to_json p e.loc
  | Pexpr_block b -> block_expression_to_json b e.loc
  | Pexpr_paren exp -> paren_expression_to_json exp e.loc
  | Pexpr_tuple exprs -> tuple_expression_to_json exprs e.loc

and tuple_expression_to_json exprs loc : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ExprTuple"
    ; "exprs", `List (List.map ~f:expression_to_json exprs)
    ; "loc", loc_to_json loc
    ]

and paren_expression_to_json e loc : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ExprParen"; "expr", expression_to_json e; "loc", loc_to_json loc ]

and block_expression_to_json b loc : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ExprBlock"; "block", block_to_json b; "loc", loc_to_json loc ]

and path_expression_to_json p loc : Yojson.Basic.t =
  `Assoc [ "_type", `String "ExprPath"; "path", path_to_json p; "loc", loc_to_json loc ]

and literal_expression_to_json l loc : Yojson.Basic.t =
  `Assoc [ "_type", `String "ExprLit"; "lit", literal_to_json l; "loc", loc_to_json loc ]

and unary_expression_to_json (op, expr) loc : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ExprUnary"
    ; "op", `String (un_op_to_string op)
    ; "expr", expression_to_json expr
    ; "loc", loc_to_json loc
    ]

and binary_expression_to_json (left, op, right) loc : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ExprBinary"
    ; "left", expression_to_json left
    ; "op", `String (bin_op_to_string op)
    ; "right", expression_to_json right
    ; "loc", loc_to_json loc
    ]

and statement_to_json (stmt : statement) : Yojson.Basic.t =
  match stmt.kind with
  | Pstmt_empty -> `Assoc [ "_type", `String "StmtEmpty"; "loc", loc_to_json stmt.loc ]
  | Pstmt_item i -> item_to_json i
  | Pstmt_semi e ->
    `Assoc
      [ "_type", `String "StmtSemi"
      ; "expr", expression_to_json e
      ; "loc", loc_to_json stmt.loc
      ]
  | Pstmt_expr e -> expression_to_json e

and block_to_json block : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "Block"
    ; ( "statements"
      , `List
          (match block.stmts with
           | Some s -> List.map ~f:statement_to_json s
           | None -> []) )
    ; "loc", loc_to_json block.loc
    ]

and fn_to_json { kind = Pitem_function (id, params, ret_ty, body); loc } : Yojson.Basic.t =
  `Assoc
    [ "_type", `String "ItemFn"
    ; "name", identifier_to_json id
    ; "input", `List (List.map ~f:param_to_json params)
    ; ( "output"
      , match ret_ty with
        | Some ty -> ty_to_json ty
        | None -> `Null )
    ; "body", block_to_json body
    ; "loc", loc_to_json loc
    ]

and item_to_json (item : item) : Yojson.Basic.t =
  match item.kind with
  | Pitem_function _ -> fn_to_json item

and pprint_file out_channel file =
  let json_file =
    `Assoc
      [ "_type", `String "File"; "items", `List (List.map ~f:item_to_json file.items) ]
  in
  Yojson.Basic.pretty_to_channel out_channel json_file
;;
