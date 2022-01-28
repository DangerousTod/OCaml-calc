
exception Function_not_implemented of string;;

let listFun = [
	("abs","Absolute Value", abs_float);
	("sqrt", "Square Root", sqrt);
	("exp", "Exponential", exp);
	("log", "Natural Logarithm", log);
	("round", "Round", (fun x -> floor (x+.0.5)));
	];;


let function_lists var =
	let rec function_lists var list = match list with
		[] -> raise(Function_not_implemented var)
		| h::t -> match h with
					(name,_,func) -> if (var=name) then func
										else function_lists var t
	in function_lists var listFun;;

let description var =
			let rec lists var list = match list with
				[] -> raise(Function_not_implemented var)
				| h::t -> match h with
					(name,desc,_) -> if (var=name) then desc
						else lists var t
			in lists var listFun;;

let close_library () =
			let rec aux = function
				[] -> print_endline("")
				| h::t -> match h with
					(name,desc,func) -> print_endline (name ^ " : " ^ desc);
						aux t;
			in aux listFun;;









