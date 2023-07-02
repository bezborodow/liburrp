%{
#define YYSTYPE char*
#include "y.tab.h"
%}

PYIDENTSTART [a-zA-Z_]
PYIDENTCONT [a-zA-Z0-9_]
URIUNRESERVED [a-zA-Z0-9,._~-]

%% 

"int" { return INT; }
"string" { return STRING; }
"float" { return FLOAT; }
"path" { return PATH; }
"uuid" { return UIID; }
"/" { return SLASH; }
"<" { return LANGLE; }
">" { return RANGLE; }
":" { return SEMICOLON; }
{PYIDENTSTART}{PYIDENTCONT}+ {
    yylval.pyid = strdup(yytext);
    return PYIDENT;
}
{URIUNRESERVED}+ {
    yylval.uri = strdup(yytext);
    return URIUNRESERVED;
}

%%
