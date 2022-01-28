

open Dictionary;;
open Library;;

type operator_binary = Sum | Difference | Product | Quotient;;

type operator_unary = Opposite | Function of string;;

type arithmetic_expression = 
				Constant of float
				| Variable of string
				| Operation_unary of operator_unary * arithmetic_expression
				| Operation_binary of operator_binary * arithmetic_expression * arithmetic_expression;;

let evaluate_expression dic ex =
				let rec aux = function
					Constant cte -> cte
					| Variable var -> consult_valor dic var
					| Operation_unary (oper, ex1) -> (
						match oper with
							Opposite -> (aux ex1) *. (-1.)

	(*						| Function name -> (function name) (aux ex1)			*)
						)
					| Operation_binary (oper,ex1,ex2) -> (
								match oper with
									Sum -> (aux ex1) +. (aux ex2)
									| Difference -> (aux ex1) -. (aux ex2)
									| Product -> (aux ex1) *. (aux ex2)
									| Quotient -> (aux ex1) /. (aux ex2)
								)
				in aux ex;;










