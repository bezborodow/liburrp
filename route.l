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
