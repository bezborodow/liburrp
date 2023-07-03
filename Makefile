all:
	flex -v route.l
	yacc -d route.y
	gcc lex.yy.c y.tab.c y.tab.h -lfl
