open Core
open Lexing
open Lexer

let print_error_position lexbuf =
  let pos = lexbuf.lex_curr_p in
  Fmt.str
    "Filename: %s Line:%d Position:%d"
    pos.pos_fname
    pos.pos_lnum
    (pos.pos_cnum - pos.pos_bol + 1)
;;

let parse_file lexbuf =
  try Ok (Parser.file Lexer.read_token lexbuf) with
  | SyntaxError msg ->
    let error_msg = Fmt.str "%s: %s@." (print_error_position lexbuf) msg in
    Error (Error.of_string error_msg)
  | Parser.Error ->
    let error_msg = Fmt.str "%s: syntax error@." (print_error_position lexbuf) in
    Error (Error.of_string error_msg)
;;

let pprint_ast out_channel ast = Pprintast.pprint_file out_channel ast
