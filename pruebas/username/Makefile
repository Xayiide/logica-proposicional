
.PHONY: all clean re

all:
	flex username.l
	gcc lex.yy.c -o username -lfl

clean:
	@rm -f username lex.yy.c
	@echo "clean"

re: clean all
