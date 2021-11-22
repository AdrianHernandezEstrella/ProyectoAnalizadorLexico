package analizador;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
private Symbol symbol(int type, Object value){
return new Symbol(type, yyline, yycolumn, value);
}
private Symbol symbol(int type){
return new Symbol(type, yyline, yycolumn);
}
%}
%%
%%
/* Espacios*/
{espacio} {/*Ignore*/}
/* Comentarios */
( "//"(.)* ) {/*Ignore*/}
/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas);}
/* Tipos de datos */
( byte | char | long | float | double ) {return new Symbol(sym.T_dato);}
/* Int (Para el main) */
( "int" ) {return new Symbol(sym.Int);}
/* String */
( String ) {return new Symbol(sym.Cadena);}
/* Reservada If */
( if ) {return new Symbol(sym.If);}
/* Reservada Else */
( else ) {return new Symbol(sym.Else);}
/* Reservada Do */
( do ) {return new Symbol(sym.Do);}
/* Reservada While */
( while ) {return new Symbol(sym.While);}
/* Reservada For */
( for ) {return new Symbol(sym.For);}
/* Igual */
( "=" ) {return new Symbol(sym.Igual);}
/* Suma */
( "+" ) {return new Symbol(sym.Suma);}
/* Resta */
( "-" ) {return new Symbol(sym.Resta);}
/* Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion);}
/* Division */
( "/" ) {return new Symbol(sym.Division);}
/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico);}
/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new
Symbol(sym.Op_relacional);}
/* Operadores Atribucion */
( "+=" | "-=" | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion);}
/* Operadores Incremento decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento);}
/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano);}
/* Parentesis a*/
( "(" ) {return new Symbol(sym.Parentesis_a);}
/* Parentesis c */
( ")" ) {return new Symbol(sym.Parentesis_c);}
/* Llave a */
( "{" ) {return new Symbol(sym.Llave_a);}
/* Llave c */
( "}" ) {return new Symbol(sym.Llave_c);}
/* Corchete a */
( "[" ) {return new Symbol(sym.Corchete_a);}
/* Corchete c */
( "]" ) {return new Symbol(sym.Corchete_c);}
/* Inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main);}
/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma);}
/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador);}
/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero);}
/* Error de analisis */
. {return new Symbol(sym.ERROR);}
