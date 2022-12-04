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
//Procedimiento que me permite cambiar el valor de la clave del jugador o piedra
function CambiaClave(Clave:longint; Tipo:string): integer;
begin
  repeat
    writeln('Inserte el valor nuevo de su ',tipo);
    readln(Clave);
    if clave<1 then
    begin
      writeln('El valor de la clave debe de ser mayor o igual a 1')
    end;
  until (clave>=1);
  CambiaClave:=Clave;
end;
//=======================================================================================

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
  Function Triangular(n,num:longint): boolean;
  Var
    i,tri: longint;
    b: boolean;
  Begin
    tri := 0;
    b := false;
    If n<Num Then
      Begin
        For i := 1 To N Do
          Begin
            tri := tri+i;
          End;
        If tri=num Then
          Begin
            b := true;
          End;
      End
    Else
      Begin
        For i := 1 To num Do
          Begin
            tri := tri+i;
          End;
        If tri=n Then
          Begin
            b := true;
          End;
      End;
    triangular := b;
  End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si son números primos relativos

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números está contenido en el otro.
  Function Contenido(Num,N: longint): boolean;
    Var
      p,m: string;
      i: longint;
      b: boolean;
    Begin
      m:= NumStr(n);
      p:= NumStr(num);
      b:= false;
      If N<num Then
        Begin
          i:= pos(m,p);
          If (i<>0) Then
            Begin
              b:= true;
            End;
        End
      Else
        Begin
          i:= pos(p,m);
          If (i<>0) Then
            Begin
              b:= true;
            End;
        End;
      Contenido:=b
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números es el inverso del otro.
  Function Inverso(n,num:longint): boolean;
    Var
      b: boolean;
      c,i,inv: longint;
    Begin
      inv:=0;
      c := Digitos(num);
      b := false;
      For i := 1 To c Do
        Begin
          inv:= (num Mod 10)+(inv*10);
          num:= num Div 10;
        End;
      If inv=n Then
        Begin
          b:= true;
        End;
      inverso:=b;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el número de la piedra es “amigo” del número del explorador. y viseverza
  Function Amigo(num,n:longint): boolean;
    Var
      n1,n2: longint;
      b: boolean;
    //funcion para optimizar este proceso
    Function SumaDivisores(n:longint): longint;
      Var
        i,suma: longint;
      Begin
        suma := 0;
        For i := 1 To (n) Do
          Begin
            If ((n Mod i)=0) Then
              Begin
                suma := suma+i;
              End;
          End;
        SumaDivisores := suma;
      End;
    Begin
      N1 := SumaDivisores(n)-N;
      n2 := SumaDivisores(num)-num;
      b := false;
      If (n1=num) And (n2=n) Then
        Begin
          B := true;
        End;
      amigo := b;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Este Procedure muestra un menú con todas las opciones para probarlas individualmente
  Procedure Menu_Clave(debug_access:string);
    var Eleccion:Byte;
    Begin
      debug_access:='';
      readln(Debug_Access);
      if Debug_Access='Admin' then
      Begin
        writeln('entraste al menú de Debug');
        writeln('1:determina si los números iguales');
        Writeln('2:determina si la clave es multiplo de de la piedra y viceversa');
        writeln('3:determina si números triangulares');
        writeln('4:determina si "" ');
        writeln('5:determina si uno de los números está contenido en el otro.');
        writeln('6:determina si uno de los números es el inverso del otro.');
        writeln('7:determina si el número de la piedra es “amigo” del número del explorador y viseverza.');
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
              Triangular(Clave,Piedra);
            if (Triangular(Clave,Piedra))=true then writeln('Los números son Triangulares') else writeln('Los números no son triangulares');
          End;
          4:Begin
            Writeln(4);
          End;
          5:Begin
            Contenido(Clave,Piedra);
            if (Contenido(Clave,Piedra))=true then writeln('Uno de los números está contenidos uno dentro del otro') else writeln('Ninguno de los números esta contenido dentro del otro');
            End;
          6:Begin
            Inverso(Clave,Piedra);
            if(Inverso(Clave,Piedra))=true then writeln('Los números son Inverso') else writeln('Los números no son Inversos');
          End;
          7:Begin
            Amigo(Clave,Piedra);
            if (Amigo(Clave,Piedra))=true then writeln('Los números son Amigos') else writeln('Los números no son Amigos');
          End;
        End;
        writeln('quiere seleccionar otra opción?');
      end;
    End;
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    begin
      clave_debug:='';
      Menu_Clave(clave_debug);
      if (numeros_iguales(Clave,Piedra)) or (numeros_multiplo(Clave,Piedra)) then Coincidencia_de_Clave:=true else Coincidencia_de_Clave:=False;
    end;
//=======================================================================================

Begin
  clrscr;
  Clave:=1;
  Clave:=CambiaClave(Clave,'jugador');
  Piedra:=1;
  Piedra:=CambiaClave(Piedra,'Piedra');
  Coincidencia_de_Clave(Clave,Piedra);
  writeln('llegaste al final del programa pricipal');
  readln;
end.