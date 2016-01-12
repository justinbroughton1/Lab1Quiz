%{
//**************************************
// lang.l
//
// Scanner definition file for CST 320 project
//
// Author: Phil Howard 
// phil.howard@oit.edu
//
// Date: Nov. 23, 2015
//

#include "tokens.h"

#define DO_RETURN(a) return (a)
//#define DO_RETURN(a) return Return(a)
int Return(int val);

%}

%option noyywrap
%option noinput
%option nounput
%option yylineno


    /* definitions go here. period is an example. */

left_bracket    ['[']
star            ['\*']
%%

    // token definitions go here. "if" is an example.


{left_bracket}              DO_RETURN(yytext[0]);
{star}                      DO_RETURN(yytext[0]);
"stuff"                     DO_RETURN(STUFF);
"other"                     DO_RETURN(OTHER);
[ba]*[0-9][0-9]*            DO_RETURN(BLOB2);
[ab][ab]*                   DO_RETURN(BLOB1);
[ \t\r\n]                   {};
.                           DO_RETURN(JUNK_TOKEN);

%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}

