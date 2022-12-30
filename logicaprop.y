%{
#include <stdio.h>

extern int yylex();
extern int yyparse();

int yywrap() { return 1; }

void yyerror(const char *msg)
{
    fprintf(stderr, "error: %s\n", msg);
}

int cond(int a, int b) {
    if (a == 1 && b == 0)
        return 0;
    else
        return 1;
}

int bicond(int a, int b) {
    return (a == b);
}
 
%}


%token VARPROP
%token COND BICOND
%token EOL


%%

prop
    :
    | prop linea { printf("> "); }
    ;

linea
    : EOL
    | FP EOL { printf("%d\n", $1); }
    ;

FP
    : termino
    | '(' FP ')'        { $$ = $2; } // Acepta literales entre paréntesis
    | FP COND   termino { $$ = cond($1, $3); }
    | FP BICOND termino { $$ = bicond($1, $3); }
    ;

termino
    : literal
    | termino 'v' literal { $$ = $1 || $3; }
    | termino '^' literal { $$ = $1 && $3; }
    ;

literal
    : variablep
    | '!' literal { $$ = !$2; }
    ;

variablep
    : VARPROP { }
    ;

%%

int main(int argc, char **argv) {
    printf("> ");
    yyparse();
}
