%{
#define YYSTYPE char*
#include <stdio.h>
%}


%token URIUNRESERVED
%token PYIDENT
%token INT, STRING, FLOAT, PATH, UIID
%token LANGLE, SEMICOLON, RANGLE
%token SLASH
%token START

%%

start: SLASH
     ;

%%

void yyerror(char *error)
{
    fprintf(stderr, "Error: %s\n" , error);
}

int main(int argc, char **argv)
{
    yyparse();
}
