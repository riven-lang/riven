open Core

let main filename =
  match Compile.file filename with
  | Ok _ -> print_endline "compiled"
  | Error e -> eprintf "%s" (Error.to_string_hum e)
;;
