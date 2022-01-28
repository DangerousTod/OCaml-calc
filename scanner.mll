{
  open Parser;;
  exception Lexical_error;;
}
rule token = parse
    [' ' '\t']												{ token lexbuf }
  | '+'															{ ADD }
  | '-'															{ MINUS }
  | '*'															{ MUL }
  | '/'															{ DIV }
  | '='															{ EQUAL }
  | '('															{ PARENOP }
  | ')'															{ PARENCL }
  | ['0' - '9']+('.'['0'-'9']*)?(['e' 'E'](['+' '-'])?['0'-'9']+)?
																		{ CONSTANT (float_of_string (Lexing.lexeme lexbuf)) }
  | '!'['a'-'z']+										{ let s = Lexing.lexeme lexbuf in FUNCTION (String.sub s 1 (String.length s - 1)) }
  | '#'['a'-'z']+									{ let s = Lexing.lexeme lexbuf in COMMAND (String.sub s 1 (String.length s - 1)) }
  | ['A'-'Z' 'a'-'z'] (['A'-'Z' 'a'-'z' '0'-'9' '_' '|'])*
																		{ VARIABLE (Lexing.lexeme lexbuf) }
  | eof														{ EOF }
  | _																{ raise Lexical_error }







