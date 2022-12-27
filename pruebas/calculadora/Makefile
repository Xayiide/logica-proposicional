CC     = gcc
LFLAGS = -lfl

TGT = calc
LEX = $(TGT).l
SYN = $(TGT).y

all: $(LEX) $(SYN)
	bison -d $(SYN)
	flex $(LEX)
	$(CC) -o $(TGT) $(TGT).tab.c lex.yy.c $(LFLAGS)

clean:
	@rm -f *tab* lex* $(TGT)
	@echo "clean"
