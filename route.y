%{
#define YYSTYPE char*
#include <stdio.h>
%}


%token ALPHA, DIGIT, URIUNRESERVED
%token STRING, INT, FLOAT, PATH, ANY, UUID
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

uripart: uripartchars
       ;

uripartchars: ALPHA
            | DIGIT
            | URIUNRESERVED
            ;

variable: LANGLE converter varname RANGLE
        | LANGLE varname RANGLE
        ;

converter: STRING
         | INT
         | FLOAT
         | PATH
         | ANY
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
