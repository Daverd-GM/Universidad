{
    $Id: gplunit.pt,v 1.2 2002/09/07 15:40:47 peter Exp 2022/11/19 22:14:58 peter Exp $
    This file is part of Proyecto Algoritmos y programaci�n 1
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
  // Esta función
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Este Procedure muestra un menú con todas las opciones para probarlas individualmente
  Procedure Menu_Clave(debug_access:string);
  var Eleccion:Byte; regresar:boolean;
  Begin
        readln(Debug_Access);
        if Debug_Access='Admin' then
        begin
          repeat
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
          writeln('quiere seleccionar otra opci�n?');
          Until regresar=false;
        end;
  End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 begin
        Menu_Clave(clave_debug);
        if (numeros_iguales(Clave,Piedra)) or (numeros_multiplo(Clave,Piedra)) then Coincidencia_de_Clave:=true else Coincidencia_de_Clave:=False;
 end;
 //======================================================================================
Begin
  clrscr;
  readln(Clave);
  Readln(Piedra);
  Coincidencia_de_Clave(Clave,Piedra);
  writeln('llegaste al final del programa pricipal');
  readln;
end.
