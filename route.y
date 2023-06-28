%{
#include<stdio.h>
#include<stdlib.h>

/* Custom function to print an operator*/
void print_operator(char op);

/* Variable to keep track of the position of the number in the input */
int pos=0;

%}

%union
{
    int number;
    char *string;
}
%token DIGIT
%token <string> WORD
%left '/'
%%

start: '/' parts '\n'		{exit(1);}
     ;

parts: parts '/' part
     | part
part: characters
    ;

characters: characters character
          |
          ;

character: DIGIT
         | 'a'
         | 'b'
         ;
%%


void print_operator(char c){
    printf("%c\n", c);
    return;
}

yyerror(char const *s)
{
    printf("yyerror %s",s);
}

yylex(){
    char c;
    c = getchar();
    if(isdigit(c)){
        pos++;
        return DIGIT;
    }
    else if(c == ' '){
        yylex();         /*This is to ignore whitespaces in the input*/
    }
    else {
        return c;
    }
}

main()
{
	yyparse();
	return 1;
}
