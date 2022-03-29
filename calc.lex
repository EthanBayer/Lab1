   /* cs152-calculator */
   
%{   
   /* write your C code here for definition of variables and including headers */
   //int count = 2 + 3;
%}


   /* some common rules, for example DIGIT (RULES section)*/
DIGIT    [0-9]
   
%%
   /* specific lexer rules in regex */
"+"   {printf("PLUS");}
"-"   {printf("MINUS");}
"/"   {printf("DIV");}
"*"   {printf("MULT");}
"("   {printf("L_PAREN\n");}
")"   {printf("R_PAREN ");}
"="            {printf("EQUAL\n"); }
{DIGIT}+       {printf("NUMBER %s\n", yytext); }
.  {printf("ERROR, NOT RECOGNIZED SYMBOL\n"); exit(0);}
%%
	/* C functions used in lexer, runs the rules section */

int main(int argc, char ** argv)
{
   yylex();
}

