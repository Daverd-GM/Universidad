
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
  i:Byte;
  CaracterC:Char;
  X,Y:Byte;
  Bolso1,Bolso2:Byte;
  Entrada:text;
//Procedimiento para Pasar de Caracteres a Números
  procedure Caracter_a_Numero(Caracter:char; Var Numero:Byte);
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
//Procedimiento para Pasar de Caracteres a Números
Procedure Caracter_a_Numero_Long(Caracter:char; Var Numero:Longint);
Begin
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
  End;
End;

//Procedimiento que llena la Matriz por Archivos
Procedure Mapa_por_archivo(Var Entrada:text; Var Bolso1, Bolso2, X, Y:Byte);

Var 
  CH: Char;
  i,j,color: byte;
  Clave: Longint;
Begin
  Reset(entrada);

//primera linea, Dimensiones de la matriz *******************************************
  X := 0;
  Y := 0;
  Bolso2 := 0 ;
  Bolso1 := 0;
  Repeat
    read(Entrada,CH);
  Until (CH='(');
  Repeat
    read(entrada,CH);
    Caracter_a_Numero(Ch,X);
  Until (CH=',') Or (Ch=')') Or (eoln(Entrada));
  WriteLN(x);
  Repeat
    read(entrada,CH);
    Caracter_a_Numero(Ch,Y);
  Until (CH=')') Or (eoln(Entrada));
  Readln(entrada,Ch);
Writeln(y);
//Segunda linea, bolsos *************************************************************
  If (Ch='(') Then
    Begin
      Repeat
        read(entrada,CH);
        Caracter_a_Numero(Ch,Bolso1);
      Until (CH=',') Or (Ch=')') Or (eoln(Entrada));
      Writeln(bolso1);
      Repeat
        read(entrada,CH);
        Caracter_a_Numero(Ch,Bolso2);
      Until (CH=')') Or (eoln(Entrada));
      Writeln(Bolso2);
      Readln(entrada,Ch);
    End
  Else
    Begin
      Repeat
        read(Entrada,CH);
      Until (CH='(');
      Repeat
        read(entrada,CH);
        Caracter_a_Numero(Ch,Bolso1);
      Until (CH=',') Or (Ch=')') Or (eoln(Entrada));
        Writeln(Bolso1);
      Repeat
        read(entrada,CH);
        Caracter_a_Numero(Ch,Bolso2);
      Until (CH=')') Or (eoln(Entrada));
      Readln(entrada,Ch);
      Writeln(Bolso2);
    End;

//Piedras *******************************************************************************
  i := y+2;
  Repeat
    i := i-1;
    j := x+2;
    Repeat
      j := j-1;
      Color := 0;
      clave := 0;
      If (Ch='(') Then
        Begin

          Repeat
            read(entrada,CH);
            Caracter_a_Numero(Ch,Color);
          Until (CH=',') Or (Ch=')') Or (eoln(Entrada));
          Writeln(color);
          Repeat
            read(entrada,CH);
            Caracter_a_Numero_Long(Ch,Clave);
          Until (CH=')') Or (eoln(Entrada));
            Writeln(clave);
          Readln(entrada,Ch);
        End
      Else
        Begin
          Repeat
            read(Entrada,CH);
          Until (CH='(');
          Repeat
            read(entrada,CH);
            Caracter_a_Numero(Ch,Color);
          Until (CH=',') Or (Ch=')') Or (eoln(Entrada));
          Writeln(color);
          Repeat
            read(entrada,CH);
            Caracter_a_Numero_Long(Ch,Clave);
          Until (CH=')') Or (eoln(Entrada));
          Writeln(clave);
          Readln(entrada,Ch);
        End;
    Until (eof(Entrada) Or (j<=2));
  Until (eof(Entrada) Or (i<=2));
  Close(entrada);
End;

begin
  assign(Entrada,'C:\Datos\Entrada.txt');
  Mapa_por_archivo(Entrada,Bolso1,Bolso2,X,Y);
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
  {VerArchivoenPantalla(X,Y)}
end.