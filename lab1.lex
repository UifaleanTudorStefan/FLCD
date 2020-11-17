%{
#include <stdlib.h>
#include <string.h>
#include <math.h>
#undef yywrap
#define yywrap() 1 

typedef struct {
    int value;
} _pif;

typedef struct {
    char name[10]

} _symbolTable;

int pifLength = 0;
int stLength = 0;
int constLength = 0;
int idLength = 0;

int const_code = 0;
int identifier_code = 1;

_pif PIF[100];
_symbolTable identifier[30];
float const[30];


void addElemInPIF( int value)
{
    PIF[pifLength].value = value;
    pifLength++;
}


void addIdentifier(char* key)
{
    int found = 0;
    int i = 0;

    while(i < idLength)
    {
        int rez = strcmp(identifier[i].name,key);
        if(strcmp(identifier[i].name,key) == 0)
        {
            found = 1;
            addElemInPIF(identifier_code);
        }
        i++;
    }

    if(found == 0)
    {
        strcpy(identifier[idLength].name,key);
        addElemInPIF(identifier_code);
        idLength++;
    }

}

void addConstant(char* key)
{
    int found=0;
    for(int i=0; i<constLength; i++)
    {
        if(const[i] == key)
            {
                found = 0;
                addElemInPIF(const_code);
            }

        if(found == 0)
        {
            const[constLength] = key;
            addElemInPIF(const_code);
        }
    }
}


void printAll() 
{
	
    printf("PIF:\n");
    for(int i=0; i<pifLength; i++)
        printf("%d \n", PIF[i].value);
    
    printf("Constants:\n");
    int i;
    for(i = 0 ;i<constLength;i++)
        printf(" %f|%d", const[i] , i);
    printf("\n");

    printf("Identifiers\n");
    int i;
    for(i = 0 ;i<idLength;i++)
        printf(" %s|%d", identifier[i].nume , i);
    printf("\n");
}
%}

NZDIGIT 	[1-9]
DIGIT 		[0-9]
LETTER      [A-Z]
IDENTIFIER  [a-zA-Z][a-zA-Z_]*[0-9]

%%
{DIGIT}+ addConstant(yytext);
{DIGIT}+"."{DIGIT}*  addConstant(yytext);  

\id        addElemInPIF(0);
\const     addElemInPIF(1);
integer    addElemInPIF(2);
begin      addElemInPIF(3);
mod        addElemInPIF(4);
for        addElemInPIF(5);
read       addElemInPIF(6);
if         addElemInPIF(7);
end        addElemInPIF(8);
read       addElemInPIF(9);
write      addElemInPIF(10);
real       addElemInPIF(11);
array      addElemInPIF(12);
of         addElemInPIF(13);
\( addElemInPIF(14);
\) addElemInPIF(15);
\{ addElemInPIF(16);
\} addElemInPIF(17);
\[ addElemInPIF(18);
\] addElemInPIF(19);
\== addElemInPIF(20);
\+ addElemInPIF(21);
\- addElemInPIF(22);
\* addElemInPIF(23);
\/ addElemInPIF(24);
\% addElemInPIF(25);
\> addElemInPIF(26);
\>= addElemInPIF(27);
\== addElemInPIF(28);
\<= addElemInPIF(29);
\< addElemInPIF(30);
\; addElemInPIF(31);
\: addElemInPIF(32);
\or addElemInPIF(33);
\and addElemInPIF(34);

{IDENTIFIER} 		{
					addIdentifier(yytext); 
					}


"{"[^}\n]"}" 		/ eat up one-line comments */ 

[ \t\n]+ 		/* eat up whitespace */ 
		 

%%
int main( argc, argv )
int argc;
char **argv;
{
    ++argv, --argc; /* skip over program name */
	
    if ( argc > 0 ) {
    	yyin = fopen( argv[0], "r" );
    } else 
        {
     	    yyin = stdin;
        }
    
    yylex();
    printAll();
	return 0;
}