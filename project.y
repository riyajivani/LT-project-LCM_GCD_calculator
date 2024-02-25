%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);

int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int lcm(int a, int b) {
    return (a * b) / gcd(a, b);
}

%}

%token NUM
%token WS

%%

input: NUM WS NUM { 
				printf("GCD: %d\n", gcd($1, $3)); 					
				printf("LCM: %d\n", lcm($1, $3)); 
				}
     ;
%%

int main() {

	printf("enter any two numbers to find lcm anf gcf of that.\n");
	
    yyparse();
    return 0;
}

yyerror(char *s) 
{ 
	fprintf(stdout, "\n%s", s); 
} 

