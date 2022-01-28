%{
			open Instruction;;
			open Expr_arit;;
%}

%token EOF
%token ADD MINUS MUL DIV EQUAL
%token PARENOP PARENCL
%token <float> CONSTANT
%token <string> COMMAND
%token <string> COMMAND
%token <string> VARIABLE
%token <string> FUNCTION

%left MINUS ADD
%left MUL DIV
%nonassoc NEWLINE
%nonassoc FUNCTION

%start s
%type <Instruction.instruction> s

%%

s:
		VARIABLE EQUAL expr EOF				{ Assignment ($1,$3) }
	| expr EOF																			{ Calculation $1 }
	| COMMAND EOF													{ Command $1 }
;

expr:
		CONSTANT																					{ Constant $1 }
	| VARIABLE																						{ Variable $1 }
	| PARENOP expr PARENCL										{ $2 }
	| expr ADD expr																				{ Operation_binary (Sum,$1,$3) }
	| expr MINUS expr																		{ Operation_binary (Difference,$1,$3) }
	| expr MUL expr																				{ Operation_binary (Product,$1,$3) }
	| expr DIV expr																				{ Operation_binary (Quotient,$1,$3) }
	| MINUS expr					%prec NEWLINE				{ Operation_unary (Opposite,$2) }
	| FUNCTION expr		%prec FUNCTION			{ Operation_unary (Function $1,$2) }
;


































