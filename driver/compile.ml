open Core

let print_if cond print_fn ast =
  if cond
  then (
    Out_channel.with_file "ast.json" ~f:(fun out -> print_fn out ast);
    Ok ast)
  else Ok ast
;;

let set_filename filename lexbuf =
  Lexing.set_filename lexbuf filename;
  lexbuf
;;

let get_lexbuf filename =
  In_channel.read_all filename |> Lexing.from_string |> set_filename filename
;;

let parse_file filename = Parsing.Parse.parse_file (get_lexbuf filename)

let file filename =
  let open Result in
  parse_file filename >>= print_if true Parsing.Parse.pprint_ast
;;
