        int num_lineas = 0, num_caracteres = 0;

%%

\n  ++num_lineas; ++num_caracteres;
.   ++num_caracteres;

%%

int main() {
    yylex();
    printf("# de líneas: %d\n", num_lineas);
    printf("# de caracteres: %d\n", num_caracteres);
}
