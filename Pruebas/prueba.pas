
{
    $Id: gplprog.pt,v 1.2 2002/09/07 15:40:47 peter Exp 2022/10/09 02:01:46 peter Exp $
    This file is part of sa
    Copyright (c) 2022 by da

    $PROMPT('Description of file')

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}

Program que;


const Max_Color=10;
Var
  CaracterC:Char;
  X,Y:Byte;
  Bolso1,Bolso2:Byte;
//Procedimiento para Pasar de Caracteres a Números
  procedure Caracter_a_Nuemero(Caracter:char; Var Numero:Byte);
  begin
    Case Caracter Of 
      '1': Numero := 1 + Numero*10;
      '2': Numero := 2 + Numero*10;
      '3': Numero := 3 + Numero*10;
      '4': Numero := 4 + Numero*10;
      '5': Numero := 5 + Numero*10;
      '6': Numero := 6 + Numero*10;
      '7': Numero := 7 + Numero*10;
      '8': Numero := 8 + Numero*10;
      '9': Numero := 9 + Numero*10;
      '0': Numero := 0 + Numero*10;
    end;
End;
//=============================================================================
//Procedimiento que llena la Matriz por Archivos
  procedure VerArchivoenPantalla(Var X,Y:Byte);
  Var
    CH:Char;
    Entrada:text;
  Begin
    assign(Entrada,'C:\Datos\Entrada.txt');
    Reset(entrada);
    //primera linea, Dimensiones de la matriz
    repeat
      read(Entrada,CH);
    until (CH='(');      
    repeat
      read(Entrada,CH);
      writeln(ch);
      Caracter_a_Nuemero(Ch,X);
    until (CH=',');
    writeln(X);
    Repeat
    read(entrada,CH);
    Caracter_a_Nuemero(Ch,Y);
    Until (CH=')');
    Writeln(Y);
    Readln(entrada,Ch);
  //Segunda linea, bolsos
    if (Ch='(') then
    begin
      Repeat
        read(Entrada,CH);
        writeln(ch);
        Caracter_a_Nuemero(Ch,Bolso1);
      Until (CH=',');
      writeln(bolso1);
      Repeat
        read(Entrada,CH);
      writeln(ch);
        Caracter_a_Nuemero(Ch,Bolso2);
      Until (CH=')');
      writeln(bolso2);

      Readln(entrada,Ch);
    end
    else
    begin
      Repeat
        read(Entrada,CH);
      Until (CH='(');
      Repeat
        read(Entrada,CH);
        Caracter_a_Nuemero(Ch,Bolso1);
      Until (CH=',');
      writeln(bolso1);
      Repeat
        read(Entrada,CH);
      writeln(ch);
        Caracter_a_Nuemero(Ch,Bolso2);
      Until (CH=')');
      writeln(bolso2);

      Readln(entrada,Ch);
    end;
    Close(entrada);
  End;
begin
  
  {begin  
    writeln;
    Writeln('hola1');
    reset(Mapa_Entrada);
    Writeln('hola2');
    while not (eof (Mapa_Entrada)) do
    begin
      readln(Mapa_Entrada, caracterC) ;
      Write(caracterC);
    end;
    close(Mapa_Entrada);
    Writeln('hola3')
  end;}
  VerArchivoenPantalla(X,Y)
end.