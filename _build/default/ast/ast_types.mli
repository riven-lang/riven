type bin_op =
  | BinOpPlus
  | BinOpMinus
  | BinOpMultiply
  | BinOpDivide
  | BinOpModulo
  | BinOpNotEq
  | BinOpEq
  | BinOpLess
  | BinOpGreater
  | BinOpLessEqual
  | BinOpGreaterEqual
  | BinOpAnd
  | BinOpOr

val bin_op_to_string : bin_op -> string

type un_op =
  | UnOpNot
  | UnOpNeg

val un_op_to_string : un_op -> string

module Ident : sig
  type t

  val of_string : string -> t
  val to_string : t -> string
  val ( = ) : t -> t -> bool
end

module Location : sig
  type t =
    { start_pos : Lexing.position
    ; end_pos : Lexing.position
    }
end
