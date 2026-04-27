/* recognize tokens for the calculator */

%option noyywrap

%{ 
#include "token.h"
%}

Digito      	[0-9]
Alfabeto	[a-zA-Z_]
Decimal     	{Digito}+
Real   		{Digito}+"."{Digito}+
Variavel	{Alfabeto}+{Decimal}*{Alfabeto}*
String		\"[{Alfabeto}| \n | {Real} | + | - | * \( | \)]*\"


%%
[ \t]+ ;
"//"[^\n]* ; 

"print"		{return PRINT;}
"concat"	{return CONCAT;}
"length"	{return LENGTH;}
{Real}     	{return NUM;}
{Decimal}   	{return NUM;}
{String}	{return STR;}
{Variavel}	{return ID;}
"+"          	{return PLUS;}
"-"      	{return MINUS;}
"*"       	{return TIMES;}
"/"    		{return DIV;}
"("		{return LPAR;}
")"		{return RPAR;}
"="		{return EQ;}
\n           	{return EOL;}
.            	{return ERROR;}

%%
