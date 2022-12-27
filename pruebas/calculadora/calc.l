%{
#include <stdlib.h>
#include "calc.tab.h"
%}


%%
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }

[0-9]+  { yylval = atoi(yytext); return NUM; }
\n      { return EOL;   }
[ \t]   { }
.       { printf("Caracter desconocido: %c\n", *yytext); }

%%
