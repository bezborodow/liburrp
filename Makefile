all: urrp

y.tab.c: route.y
	yacc route.y
urrp: y.tab.c
	gcc y.tab.c -o urrp
