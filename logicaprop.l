%{
    #include <stdlib.h>
    #include "logicaprop.tab.h"
%}

%%

[0-1]       { yylval = atoi(yytext); return VARPROP; }
"->"        { return COND;    }
"<->"       { return BICOND;  }

"^"         { return '^'; }
"v"         { return 'v'; }
"!"         { return '!'; }
"("         { return '('; }
")"         { return ')'; }


\n          { return EOL; }
[ \t]       { /* ignorar espacios en blanco */ }
.           { printf("Caracter desconocido: %s\n", yytext); }

%%
