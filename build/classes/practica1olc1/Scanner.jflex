package practica1olc1;

import java_cup.runtime.*;
import java.io.Reader;
import javax.swing.JOptionPane;
      
%%

%class Lexico

%line
%column 
// %ignorecase 
%cup

%{

    /***  Generamos un java_cup.symbol para guardar el tipo de token encontrado ***/
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /*** Generamos un symbol para el tipo de token encontrado junto con su valor ***/

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

%}



/*** Expresiones Regulares ***/

tCaracter =     [a-zA-ZñÑ]
tNumero =       [0-9]+
tCadena= 	[\"][^\"\n]+[\"]						
tID=		{tCaracter}({tCaracter}|{tNumero}|_)*
tDecimal=       {tNumero}+"."{tNumero}+


%%

/** TOKENS **/

<YYINITIAL> {

"<"         {System.out.print("<"); return symbol(sym.tMenor,yytext()); }
"<="        {System.out.print("<="); return symbol(sym.tMenorI,yytext()); }
">"         {System.out.print(">"); return symbol(sym.tMayor,yytext()); }
">="        {System.out.print(">= "); return symbol(sym.tMayorI,yytext()); }
"="         {System.out.print("= "); return symbol(sym.tIgual,yytext()); }
"<>"        {System.out.print("<> "); return symbol(sym.tNoIgual,yytext()); }
"And"       {System.out.print("And "); return symbol(sym.tAnd,yytext()); }
"Or"        {System.out.print("Or "); return symbol(sym.tOr,yytext()); }
"Not"       {System.out.print("Not "); return symbol(sym.tNot,yytext()); }
"+"         {System.out.print("+ "); return symbol(sym.tMas,yytext()); }
"-"         {System.out.print("- "); return symbol(sym.tMenos,yytext()); }
"*"         {System.out.print("* "); return symbol(sym.tPor,yytext()); }
"/"         {System.out.print("/ "); return symbol(sym.tDiv,yytext()); }
"&"         {System.out.print("& "); return symbol(sym.tAmberson,yytext()); }
"("         {System.out.print("( "); return symbol(sym.tPAbre,yytext()); }
")"         {System.out.print(") "); return symbol(sym.tPCierra,yytext()); }
"["         {System.out.print("( "); return symbol(sym.tCAbre,yytext()); }
"]"         {System.out.print(") "); return symbol(sym.tCCierra,yytext()); }
","         {System.out.print(", "); return symbol(sym.tComa,yytext()); }

"Module"    {System.out.print("Module "); return symbol(sym.tModule,yytext()); }
"End"       {System.out.print("End "); return symbol(sym.tEnd,yytext()); }
"Public"    {System.out.print("Public "); return symbol(sym.tPublic,yytext()); }
"Private"   {System.out.print("Private "); return symbol(sym.tPrivate,yytext()); }
"Dim"       {System.out.print("Dim "); return symbol(sym.tDim,yytext()); }
"Static"    {System.out.print("Static "); return symbol(sym.tStatic,yytext()); }
"Boolean"   {System.out.print("Boolean "); return symbol(sym.tBoolean,yytext()); }
"Char"      {System.out.print("Char "); return symbol(sym.tChar,yytext()); }
"Double"    {System.out.print("Double "); return symbol(sym.tDouble,yytext()); }
"Integer"   {System.out.print("Integer "); return symbol(sym.tInteger,yytext()); }
"Long"      {System.out.print("Long "); return symbol(sym.tLong,yytext()); }
"String"    {System.out.print("String "); return symbol(sym.tString,yytext()); }
"As"        {System.out.print("As "); return symbol(sym.tAs,yytext()); }
"Sub"       {System.out.print("Sub "); return symbol(sym.tSub,yytext()); }
"ByVal"     {System.out.print("ByVal "); return symbol(sym.tByVal,yytext()); }
"Main"      {System.out.print("Main "); return symbol(sym.tMain,yytext()); }
"Function"  {System.out.print("Function "); return symbol(sym.tFunction,yytext()); }
"Return"    {System.out.print("Return "); return symbol(sym.tReturn,yytext()); }
"If"        {System.out.print("If "); return symbol(sym.tIf,yytext()); }
"Then"      {System.out.print("Then "); return symbol(sym.tThen,yytext()); }
"Else"      {System.out.print("Else "); return symbol(sym.tElse,yytext()); }
"ElseIf"    {System.out.print("ElseIf "); return symbol(sym.tElseIf,yytext()); }
"While"     {System.out.print("While "); return symbol(sym.tWhile,yytext()); }
"For"       {System.out.print("For "); return symbol(sym.tFor,yytext()); }
"To"        {System.out.print("To "); return symbol(sym.tTo,yytext()); }
"Step"      {System.out.print("Step "); return symbol(sym.tStep,yytext()); }
"Next"      {System.out.print("Next "); return symbol(sym.tNext,yytext()); }
"Exit"      {System.out.print("Exit "); return symbol(sym.tExit,yytext()); }
"Do"        {System.out.print("Do "); return symbol(sym.tDo,yytext()); }
"Loop"      {System.out.print("Loop "); return symbol(sym.tLoop,yytext()); }
"Until"     {System.out.print("Until "); return symbol(sym.tUntil,yytext()); }
"Select"    {System.out.print("Select "); return symbol(sym.tSelect,yytext()); }
"Case"      {System.out.print("Case "); return symbol(sym.tCase,yytext()); }
"Break"     {System.out.print("Break "); return symbol(sym.tBreak,yytext()); }

"Console"   {System.out.print("Console"); return symbol(sym.tConsole,yytext()); }
"WriteLine" {System.out.print("WriteLine"); return symbol(sym.tWriteLine,yytext()); }
"ReadLine"  {System.out.print("ReadLine"); return symbol(sym.tReadLine,yytext()); }

[(\n|\t|\r)*] {System.out.print("Salto,Retorno... "); return symbol(sym.TabLn,yytext()); }

{tID}        {System.out.print(yytext() + " "); return symbol(sym.tID,yytext()); }
{tNumero}    {System.out.print(yytext() + " "); return symbol(sym.tNumero,yytext()); }
{tDecimal}   {System.out.print(yytext() + " "); return symbol(sym.tDecimal,yytext()); }
{tCadena}    {System.out.print(yytext() + " "); return symbol(sym.tCadena,yytext()); }

.           {JOptionPane.showMessageDialog(null, "Error Lexico : "+yytext()+", en la Linea: "+(yyline+1)+", Columna: "+(yychar+1)); }

}
