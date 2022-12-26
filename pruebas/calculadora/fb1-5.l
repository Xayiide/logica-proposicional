%{
    #include <stdlib.h>
    #include "fb1-5.tab.h"
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { }
.       { printf("Mystery character %c\n", *yytext); }

%%


