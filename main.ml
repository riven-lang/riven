let command =
  Command.basic
    ~summary:"Compile riven programs"
    ~readme:(fun () -> "a list of execution options")
    (let%map_open.Command _ =
       flag
         "-print-parse-ast"
         (optional_with_default false bool)
         ~doc:"Print the parse tree"
     and filename = anon ("filename" %: string) in
     fun () -> Driver.main filename)
;;

let () = Command_unix.run ~version:"1.0" ~build_info:"RWO command" command
