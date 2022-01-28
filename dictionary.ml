
type dictionary =
				(string*float) list;;

exception Unassigned_variable of string;;

let dictionary_new = [];;

let rec consult_valor dic var = match dic with
				[] -> raise(Unassigned_variable var)
				| h::t -> if (var=fst(h)) then snd(h)
					else consult_valor t var;;

let assign_valor dic var valor =
				let rec aux dic dic_aux var valor = match dic with
					[] -> (var,valor)::dic_aux
					| h::t -> if (var=fst(h)) then (var,valor)::dic_aux @ t
						else aux t (h::dic_aux) var valor
				in aux dic [] var valor;;

let rec close_dictionary dic = match dic with
				[] -> print_endline("")
				| h::t ->				print_endline (fst(h) ^ " = " ^ (string_of_float (snd(h))));
					close_dictionary t;;













