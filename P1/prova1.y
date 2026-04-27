%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL
%token ERROR
%token NUM
%token PLUS
%token	MINUS
%token	TIMES
%token DIV
%token PRINT	
%token	IDENT
%token STR
%token ASSIGN
%token LPAREN
%token RPAREN
%token  CONCAT
%token LENGTH
%token VIR

%start program

%%

/* programa */
program
: stmt_list
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;
exprlist
	: expr
	| exprlist VIR expr
	;

expr
/* completar */
	: expr PLUS expr 
	| expr MINUS expr 
	| expr TIMES expr 
	| expr DIV expr 
	| LPAREN expr RPAREN
	| LENGTH LPAREN expr RPAREN
	| CONCAT LPAREN expr VIR exprlist RPAREN
	| NUM
	| STR
	| IDENT
	;
%%
