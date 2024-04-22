open Base

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

let bin_op_to_string bin_op =
  match bin_op with
  | BinOpPlus -> "+"
  | BinOpMinus -> "-"
  | BinOpMultiply -> "*"
  | BinOpDivide -> "/"
  | BinOpModulo -> "%"
  | BinOpNotEq -> "!="
  | BinOpEq -> "=="
  | BinOpLess -> "<"
  | BinOpGreater -> ">"
  | BinOpLessEqual -> "<="
  | BinOpGreaterEqual -> ">="
  | BinOpAnd -> "&&"
  | BinOpOr -> "||"
;;

type un_op =
  | UnOpNot
  | UnOpNeg

let un_op_to_string un_op =
  match un_op with
  | UnOpNeg -> "-"
  | UnOpNot -> "!"
;;

module Ident = struct
  type t = string

  let of_string x = x
  let to_string x = x
  let ( = ) = String.( = )
end

module Location = struct
  type t =
    { start_pos : Lexing.position
    ; end_pos : Lexing.position
    }
end
