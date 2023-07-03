%{
#define YYSTYPE char*
#include <stdio.h>
%}


%token ALPHA, DIGIT, URIUNRESERVED
%token INT, STRING, FLOAT, PATH, UUID
%token LANGLE, SEMICOLON, RANGLE
%token SLASH

%%

start: SLASH parts { exit(0); }
     | SLASH
     ;

parts: parts part
     | part
     ;

part: uripart
    | SLASH
    | variable
    ;

uripart: uripart uripartchars
       | uripartchars
       ;

uripartchars: ALPHA
            | DIGIT
            | URIUNRESERVED


variable: LANGLE varname RANGLE
        | LANGLE converter SEMICOLON varname RANGLE
        ;

converter: STRING
         | FLOAT
         | INT
         | PATH
         | UUID
         ;

varname: ALPHA pyidentcont
       | ALPHA
       ;

pyidentcont: pyidentcont pyidchars
           | pyidchars
           ;

pyidchars: ALPHA
         | DIGIT
         ;

%%

void yyerror(char *error)
{
    fprintf(stderr, "Error: %s\n" , error);
}

int main(int argc, char **argv)
{
    yyparse();
    return 0;
}
