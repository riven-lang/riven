open Core

val parse_file : Lexing.lexbuf -> Parse_tree.file Or_error.t
val pprint_ast : Out_channel.t -> Parse_tree.file -> unit
