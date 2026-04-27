/* recognize tokens for the calculator */

%option noyywrap

%{ 
#include "prova1.tab.h"
%}

Digito      	[0-9]
Alfabeto	[a-zA-Z_]
Decimal     	{Digito}+
Real   		{Digito}+"."{Digito}+
Variavel	{Alfabeto}({Decimal}|{Alfabeto})*
String		\"[^\n]*\"


%%
[ \t]+ ;
"//"[^\n]* ; 

"print"		{return PRINT;}
"concat"	{return CONCAT;}
"length"	{return LENGTH;}

{Real}     	{return NUM;}
{Decimal}   	{return NUM;}
{String}	{return STR;}
"+"          	{return PLUS;}
"-"      	{return MINUS;}
"*"       	{return TIMES;}
"/"    		{return DIV;}
"("		{return LPAREN;}
")"		{return RPAREN;}
"="		{return ASSIGN;}
","		{return VIR;}
{Variavel}	{return IDENT;}
.		{return ERROR;}

%%
