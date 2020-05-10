%{
#include <stdlib.h>
#include "neura.h"
#include "y.tab.h"
void yyerror(char *);
%}

%%

[a-z]       { yylval.identifier = *yytext - 'a'; return VARIABLE;}

[0-9]*      { yylval.integerVal = atoi(yytext);  return INTEGER;  }

[-()<>=+*/;{}.]     { return *yytext;}

"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;

[ \t\n]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
int yywrap(void) {
    return 1;
}
