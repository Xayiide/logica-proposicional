CC     = gcc
LFLAGS = -lfl

TGT = logicaprop
LEX = $(TGT).l
SYN = $(TGT).y

.PHONY: all clean re

all: $(LEX) $(SYN)
	bison -d $(SYN)
	flex $(LEX)
	$(CC) -o $(TGT) $(TGT).tab.c lex.yy.c -lfl

clean:
	@rm -f *tab* lex* $(TGT)
	@echo "clean"

re: clean all
