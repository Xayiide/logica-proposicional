%{
    #include "tokens.h"
    char lex[10];   
%}

%option noyywrap
%option yylineno

VAR_PROP    [pqrstuwxyz]
OP_COND     "->"
OP_BICOND   "<->"
OP_DISY     [|v]
OP_CONJ     [&^]
OP_NEG      ["!"]
PAR_APER    ["("]
PAR_CIER    [")"]

%%

{VAR_PROP}          { strcpy(lex, yytext); return VAR_PROP;     }

{OP_COND}           { return OP_COND;      }
{OP_BICOND}         { return OP_BICOND;    }
{OP_DISY}           { strcpy(lex, yytext); return OP_DISY;      }
{OP_CONJ}           { strcpy(lex, yytext); return OP_CONJ;      }
{OP_NEG}            { strcpy(lex, yytext); return OP_NEG;       }

{PAR_APER}          { return PAR_APER;     }
{PAR_CIER}          { return PAR_CIER;     }

[ \t]       { /* ignorar espacios en blanco */ }
.           { printf("Caracter desconocido: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    ++argv; --argc;
    int tok = 0;

    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;

    while (tok = yylex()) {
        switch(tok) {
        case VAR_PROP:
            printf("Var. prop: %s\n", lex);
            break;
        case OP_DISY:
            printf("Disyunción: %s\n", lex);
            break;
        case OP_CONJ:
            printf("Conjunción: %s\n", lex);
            break;
        case OP_NEG:
            printf("Negación: %s\n", lex);
            break;
        }
    }

    return 0;
}


