#!/bin/bash
ocamlc -c dictionary.ml library.ml expr_arit.ml instruction.ml
ocamlyacc parser.mly
ocamllex scanner.mll
ocamlc -c parser.mli parser.ml
ocamlc -o calc dictionary.cmo library.cmo expr_arit.cmo instruction.cmo parser.mli parser.ml scanner.ml calc.ml
rm -f scanner.ml parser.ml parser.mli *.cmi *.cmo *~
