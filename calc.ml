

open Dictionary;;
open Library;;
open Instruction;;
open Parser;;
open Scanner;;
open Parsing;;

let d = ref dictionary_new;;
let start = ref true;;

print_char('\n');
print_endline("The Calculator is waiting for input...");;
print_char('\n');


while (!start) do

	print_string(">> ");

	try
		d := execute_instructions (!d) (Parser.s Scanner.token (Lexing.from_string (read_line())));
		print_char('\n');
	
	with
		Lexical_error -> print_endline ("Lexical Error"); print_char('\n')
		| Parse_error -> print_endline ("Sanity Error"); print_char('\n')
		| Unassigned_variable var -> print_endline("Variable " ^ var ^ " is not assigned"); print_char('\n')
		| Function_not_implemented func -> print_endline("Function " ^ func ^ " is not implemented"); print_char('\n')
		| Command_not_implemented c -> print_endline("Command " ^ c ^ " is not implemented"); print_char('\n')
		| Final_execution -> print_endline("... Adiós !!!");
							start := false;

done;

print_endline("");;













