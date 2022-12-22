CC  = gcc
SRC = toy_pascal.l
TGT = $(SRC:.l=)
YY  = lex.yy.c

.PHONY: all clean re

all:
	flex $(SRC)
	$(CC) $(YY) -o $(TGT) -lfl

clean:
	@rm -f $(TGT) $(YY)
	@echo "clean"

re: clean all
