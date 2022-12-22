


%{

    #include <math.h>

%}


DIGITO  [0-9]
ID      [a-z][a-z0-9]*

%%


{DIGITO}+   {
            printf("Un entero: %s [%d]\n", yytext, atoi(yytext));
            }

{DIGITO}+"."{DIGITO}+   {
            printf("Un float:  %s [%f]\n", yytext, atof(yytext));
            }

if|then|begin|end|procedure|function    {
            printf("Palabra clave: %s\n", yytext);
            }

{ID}        {
            printf("Un identificador: %s\n", yytext);
            }

"+"|"-"|"*"|"/" {
            printf("Operador: %s\n", yytext);
            }

"{"[^{}\n]*"}"  /* Cómete los comentarios de una línea */

[ \t\n]+        /* Cómete los espacios en blanco */

.               printf("Caracter no reconocido: %s\n", yytext);

%%

int main(int argc, char **argv) {
    ++argv; --argc;
    if (argc > 0) {
        yyin = fopen(argv[0], "r");
    }
    else {
        yyin = stdin;
    }
    yylex();
}
