%{
 using namespace std;
 #define ID 257
 #define NUM 258
%}

DIGITO  [0-9]
_INT	{DIGITO}+
LETRA   [A-Za-z_]

WS      [ \t\n]
ALL     [.*]
ASIMPLES     '
ADUPLAS     \"
_FLOAT	{_INT}("."{_INT})?([Ee]("+"|"-")?{_INT})?
LINHA   [^\n]*

_ID     ["/"]?({LETRA}|"$")+({LETRA}|{DIGITO}|"$")*
_STRING		({ADUPLAS})([^\"\n]|\\\"|\"\")*({ADUPLAS})
%%

{WS}    { /* ignora espaço */ } 
{_INT}   {return _INT;}
{_FLOAT} {return _FLOAT;}
{_STRING} { return _STRING;}
"$"{_ID} {return _ID;}

">="	{ return _MAIG; }
"<="	{ return _MEIG; }
"if"	{ return _IF; }
"IF"	{ return _IF; }
"+"     {return '+';}
"for"   {return _FOR;}
"For"   {return _FOR;}
"fOr"   {return _FOR;}


{_ID}    {return _ID;}

.       {return yytext[0];}


%%