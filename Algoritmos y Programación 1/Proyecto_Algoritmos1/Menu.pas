{
    $Id: gplunit.pt,v 1.2 2002/09/07 15:40:47 peter Exp 2022/11/19 22:14:58 peter Exp $
    This file is part of Proyecto Algoritmos y programación 1
    Copyright (c) 2022 by David Hidalgo CI: 29.827.224 y Daniel Castellanos CI:30.142.703

    ''

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
Program Entrega1;

uses CRT;

var Clave,Piedra:longint;

//funcion que calcula la cantidad de digitos de un número
Function Digitos(N: longint): longint;
Var 
  i: longint;
Begin
  i := 0;
  Repeat
    n := n Div 10;
    i := i+1;
  Until (n=0);
  Digitos := i;
End;
//=======================================================================================

//funcion que transforma numeros en string
Function NumStr(num:longint): String;
Var 
  p: string;
  i,n,c,cont: longint;
Begin
  p := '';
  i := num;
  cont := digitos(num);
  For c := 1 To cont Do
    Begin
      n := i Mod 10;
      Case n Of 
        1: p := '1' + p;
        2: p := '2' + p;
        3: p := '3' + p;
        4: p := '4' + p;
        5: p := '5' + p;
        6: p := '6' + p;
        7: p := '7' + p;
        8: p := '8' + p;
        9: p := '9' + p;
        0: p := '0' + p;
      End;
      i := i Div 10;
    End;
  NumStr := p;
End;
//=======================================================================================

//Esta función verifica si un número es primo o no
function versiesPrimo(numero:longint):boolean;
  var divisores,VarControl:integer;
  Begin
    divisores:=0;
    for varControl := 1 to numero/2 do
    Begin
      if numero mod varControl = 0 then
      divisores := divisores + 1;
    end;
    if divisores = 2 then
      versiesPrimo:=true{devuelve verdad si es primo}
    else
    versiesPrimo:=false;{devuelve falso si no es primo}
  end;
//=======================================================================================

//Esta función determina si la clave y piedran cumplen con alguno de los requisito de moverse
function Coincidencia_de_Clave(clave,piedra:integer):boolean;
  var Clave_Debug:String;
  // Esta función determina si los números son iguales
  function numeros_iguales(Clave,Piedra:integer):boolean;
    Begin if (clave)<>(piedra) then numeros_iguales:=false; End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si la Clave es multiplo de la Piedra o viceversa
  Function numeros_multiplo(Clave,Piedra:integer):boolean;
    begin if (Clave mod piedra <>0) and (piedra mod clave <>0) then Numeros_Multiplo:=false; end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el explorador tiene el número “n”, el número de la piedra es el n-ésimo número triangular, o viceversa.
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si son números primos relativos
  Function Numeros_Primos_relativos(Clave,Piedra:integer):boolean;
    var c1,c2:longint;
    Begin
      for c1:=1 to piedra/2 do
      Begin
        for c2:=1 to clave/2
      End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números está contenido en el otro.
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números es el inverso del otro.
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el número de la piedra es “amigo” del número del explorador.
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Este Procedure muestra un menú con todas las opciones para probarlas individualmente
  Procedure Menu_Clave(debug_access:string);
    var Eleccion:Byte;
    Begin
    readln(Debug_Access);
    if Debug_Access='Admin' then
    Begin
      writeln('entraste al menú de Debug');
      writeln('1:determina si los números iguales');
      Writeln('2:determina si la clave es multiplo de de la piedra y viceversa');
      writeln('3:determina si "" ');
      writeln('4:determina si "" ');
      writeln('5:determina si "" ');
      writeln('6:determina si "" ');
      writeln('7:determina si "" ');
      readln(Eleccion);
      case Eleccion of
        1:Begin
          Numeros_Iguales(Clave,Piedra);
          if (Numeros_Iguales(Clave,Piedra))=true then writeln('Los números son iguales') else writeln('Los números no son iguales');
        End;
        2:Begin
          Numeros_Multiplo(Clave,Piedra);
          if (Numeros_Multiplo(Clave,Piedra))=true then writeln('Los números son múltiplos') else writeln('Los números no son múltiplos');
        End;
        3:Begin
          Writeln(1);
        End;
        4:Begin
          Writeln(1);
        End;
        6:Begin
          Writeln(1);
        End;
        7:Begin
          Writeln(1);
        End;
      End;
      writeln('quiere seleccionar otra opción?');
    end;
    End;
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    begin
      Menu_Clave(clave_debug);
      if (numeros_iguales(Clave,Piedra)) or (numeros_multiplo(Clave,Piedra)) then Coincidencia_de_Clave:=true else Coincidencia_de_Clave:=False;
    end;
//=======================================================================================

Begin
  clrscr;
  readln(Clave);
  Readln(Piedra);
  Coincidencia_de_Clave(Clave,Piedra);
  writeln('llegaste al final del programa pricipal');
  readln;
end.
