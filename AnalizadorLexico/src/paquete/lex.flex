package analizador;
import static analizador.Tokens.*;
%%

%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios*/
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return T_dato;}

/* String */
( String ) {lexeme=yytext(); return Cadena;}

/* Reservada If */
( if ) {lexeme=yytext(); return If;}

/* Reservada Else */
( else ) {lexeme=yytext(); return Else;}

/**//* Palabra reservada SELECT */
( SELECT ) {lexeme=yytext(); return SELECT;}

/* Reservada FROM */
( FROM ) {lexeme=yytext(); return FROM;}
/* Reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Reservada While */
( while ) {lexeme=yytext(); return While;}

/* Reservada For */
( for ) {lexeme=yytext(); return For;}

/* Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Op_atribucion;}

/* Operadores Incremento decremento */
( "++" | "--" ) {lexeme = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Op_booleano;}

/* Parentesis a */
( "(" ) {lexeme=yytext(); return Parentesis_apertura;}

/* Parentesis c */
( ")" ) {lexeme=yytext(); return Parentesis_cierre;}

/* Llave a */
( "{" ) {lexeme=yytext(); return Llave_apertura;}

/* Llave c */
( "}" ) {lexeme=yytext(); return Llave_cierre;}

/* Corchete a */
( "[" ) {lexeme = yytext(); return Corchete_apertura;}

/* Corchete c */
( "]" ) {lexeme = yytext(); return Corchete_cierre;}

/* Inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}