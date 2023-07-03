%{
#define YYSTYPE char*
#include "y.tab.h"
%}

ALPHA [a-zA-Z_]
DIGIT [0-9]
URIUNRESERVED [,.~-]

%% 

"int" { return INT; }
"string" { return STRING; }
"float" { return FLOAT; }
"path" { return PATH; }
"uuid" { return UUID; }
"/" { return SLASH; }
"<" { return LANGLE; }
">" { return RANGLE; }
":" { return SEMICOLON; }

%%
