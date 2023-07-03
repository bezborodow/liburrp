%{
#define YYSTYPE char*
#include "y.tab.h"
%}

ALPHA [a-zA-Z_]
DIGIT [0-9]
URIUNRESERVED [,.~-]

%% 

{ALPHA} { return ALPHA; }
{DIGIT} { return DIGIT; }
{URIUNRESERVED} { return URIUNRESERVED; }
"string:" { return STRING; }
"int:" { return INT; }
"float:" { return FLOAT; }
"path:" { return PATH; }
"any:" { return ANY; }
"uuid:" { return UUID; }
"/" { return SLASH; }
"<" { return LANGLE; }
">" { return RANGLE; }
":" { return SEMICOLON; }
. {
    fprintf(stderr, "Error: Unexpected character: %c\n", *yytext);
    exit(1);
}

%%

/*
 * Function yywrap is called by lex when input is exhausted. Return 1 if you
 * are done, or 0 if more processing is required.
 */
int yywrap(void)
{
    return 1;
}
