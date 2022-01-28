

open Dictionary;;
open Expr_arit;;
open Library;;

type instruction =
	Assignment of string * arithmetic_expression
| Calculation of arithmetic_expression
| Command of string;;

exception Final_execution;;

exception Command_not_implemented of string;;

let execute_instructions dic inst= match inst with
				Assignment (var,valor) -> print_endline (var ^ " = " ^ (string_of_float (evaluate_expression dic valor)));
																																						assign_valor dic var (evaluate_expression dic valor)
				| Calculation cal -> print_endline (string_of_float (evaluate_expression dic cal));
																												dic
				| Command c -> match c with
																												"fun" -> close_library ();
																												dic
																												| "var" -> close_dictionary dic;
																												dic
																												| "fin" -> raise(Final_execution)
																												| _ -> raise(Command_not_implemented c);;















