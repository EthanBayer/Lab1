   /* cs152-calculator */
   
%{   
   /* write your C code here for definition of variables and including headers */
   int arr[4] = {0, 0, 0, 0};
%}


   /* some common rules, for example DIGIT (RULES section)*/
DIGIT    [0-9]
   
%%
   /* specific lexer rules in regex */
"+"                  {printf("PLUS "); arr[1]++;}
"-"                  {printf("MINUS "); arr[1]++;}
"/"                  {printf("DIV "); arr[1]++;}
"*"                  {printf("MULT "); arr[1]++;}
"("                  {printf("L_PAREN\n"); arr[2]++;}
")"                  {printf("R_PAREN "); arr[2]++;}
"="                  {printf("EQUAL\n"); arr[3]++;}
{DIGIT}+             {printf("NUMBER %s\n", yytext); arr[0]++; }
{DIGIT}+\.{DIGIT}+   {printf("DECIMAL %s\n", yytext); arr[0]++; }

.                    {printf("ERROR, NOT RECOGNIZED SYMBOL\n"); exit(0);}
%%
	/* C functions used in lexer, runs the rules section */

int main(int argc, char ** argv)
{
   // To run with file: ./executable filename.txt
   if (argc >= 2)
   {
      yyin = fopen(argv[1], "r");
      if (yyin == NULL)
      {
         yyin = stdin;
      }
   }
   else
   {
      yyin = stdin;
   }
   yylex();
   printf("\nNumber of Integers: %d", arr[0]);
   printf("\nNumber of Operators: %d", arr[1]);
   printf("\nNumber of Parentheses: %d", arr[2]);
   printf("\nNumber of Equal Signs: %d\n", arr[3]);
}

