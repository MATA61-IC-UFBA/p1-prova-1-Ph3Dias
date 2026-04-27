%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token EOL 0
%token ERROR
%token NUM
%token PLUS
%token	MINUS
%token	TIMES
%token DIV
%token ERROR
%token PRINT	
%token	ID
%token STR
%token	EQ
%token LPAR
%token RPAR
%token  CONCAT
%token LENGTH

%start program

%%

/* programa */
program
: stmt_list EOL
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

expr
/* completar */
	: expr PLUS expr 
	| expr MINUS expr 
	| expr TIMES expr 
	| expr DIV expr 
	| LPAR expr RPAR
	| LENGHT STR expr
	| NUM
	| STR
	;
exprlist
	: CONCAT exprlist
	| STR exprlist
	;
%%
