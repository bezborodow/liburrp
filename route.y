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
%token CONV_STRING "string"
%left '/'
%%

start: '/' parts '\n'        {exit(1);}
     ;

parts: parts '/' part
     | part
     ;

part: variable
    | characters
    ;

characters: characters character
          |
          ;

character: DIGIT
         | 'a'
         ;

variable: '<' converter ':' varname '>'
        | '<' varname '>'
        ;

converter: 's' 't' 'r' 'i' 'n' 'g'
         | 'i' 'n' 't'
         | 'f' 'l' 'o' 'a' 't'
         | 'p' 'a' 't' 'h'
         | 'u' 'u' 'i' 'd'
         ;

varname: characters
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
