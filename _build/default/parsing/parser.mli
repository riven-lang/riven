
(* The type of tokens. *)

type token = 
  | TRUE
  | STRUCT
  | STRING of (string)
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
  | INT of (int)
  | IF
  | ID of (string)
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
  | CHAR of (char)
  | BARBAR
  | BAR
  | BANGEQUAL
  | BANG
  | AMPERSAND
  | AMPERAMPER

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Parse_tree.file)
