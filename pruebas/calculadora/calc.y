%{
#include <stdio.h>

extern int yylex();
extern int yyparse();

int yywrap() { return 1; }

void yyerror(const char *msg)
{
    fprintf(stderr, "error: %s\n", msg);
}

%}
%token NUM
%token EOL

%%

calc
    :
    | calc linea { printf("> "); }
    ;

linea
    : EOL
    | expresion EOL { printf("%d\n", $1); }
    ;

expresion
    : termino
    | expresion '+' termino { $$ = $1 + $3; }
    | expresion '-' termino { $$ = $1 - $3; }
    ;

termino
    : factor
    | termino '*' factor { $$ = $1 * $3; }
    | termino '/' factor { $$ = $1 / $3; }
    ;

factor
    : numero
    | '-' factor { $$ = -$2; }
    | '+' factor { $$ = $2; }
    ;

numero
    : NUM
    | '(' expresion ')' { $$ = $2; }
    ;

%%

int main(int argc, char **argv) {
    printf("> ");
    yyparse();
}
