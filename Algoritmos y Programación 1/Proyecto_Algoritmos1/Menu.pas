{
    $Id: gplunit.pt,v 1.2 2002/09/07 15:40:47 peter Exp 2022/11/19 22:14:58 peter Exp $
    This file is part of Proyecto Algoritmos y programación 1
    Copyright (c) 2022 by David Hidalgo CI: 29.827.224 y Daniel Castellanos CI:30.142.703

    'Esta es la Primera entrega'

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
Program Entrega1;

uses CRT;

var Clave_Jugador,Piedra:longint;

//Función que me permite cambiar el valor de la clave del jugador o piedra
function CambiaClave(Clave:longint; Tipo:string): integer;
begin
  repeat
    Writeln('Inserte el valor nuevo de su ',tipo);
    Readln(Clave);
    if clave<1 then
    begin
      Writeln('El valor de la clave debe de ser mayor o igual a 1')
    end;
  until (clave>=1);
  CambiaClave:=Clave;
end;
//=======================================================================================

//función que calcula la cantidad de digitos de un número
function Digitos(N: longint): longint;
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

//función que transforma numeros en string
function NumStr(num:longint): String;
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
function Coincidencia_de_Clave(Clave_Jugador,piedra:integer):boolean;
  var Debug_Access:String;
  // Esta función determina si los números son iguales
  function numeros_iguales(Clave_Jugador,Piedra:integer):boolean;
    Begin if (Clave_Jugador)<>(piedra) then numeros_iguales:=false; End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si la Clave es multiplo de la Piedra o viceversa
  function numeros_multiplo(Clave_Jugador,Piedra:integer):boolean;
    begin if (Clave_Jugador mod piedra =0) or (piedra mod Clave_Jugador =0) then Numeros_Multiplo:=true; end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el explorador tiene el número “n”, el número de la piedra es el n-ésimo número triangular, o viceversa.
  function Triangular(n,num:longint): boolean;
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
  function Primos_Relativos(Clave_Jugador,piedra:Integer):boolean;
  var
    n1,n2,divisores,VarControl:integer;
  begin
    divisores:=0;
    if (Clave_Jugador)>=(piedra) then begin n1:=Clave_Jugador; n2:=piedra; end else begin n2:=Clave_Jugador; n1:=piedra; end;
    for VarControl := 1 to n1 do
      begin
          if (n1 mod VarControl=0) and (n2 mod VarControl=0) then
            divisores := divisores + 1;
      end;
    if divisores = 1 then
      Primos_Relativos:=true{devuelve verdad si es primo}
    else
      Primos_Relativos:=false;{devuelve falso si no es primo}
  end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números está contenido en el otro.
  function Contenido(Num,N: longint): boolean;
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
  function Inverso(n,num:longint): boolean;
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
  // Esta función determina si son números amigos.
  function Amigo(num,n:longint): boolean;
    Var
      n1,n2: longint;
      b: boolean;
    //función para optimizar este proceso
    function SumaDivisores(n:longint): longint;
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
  Procedure Menu_Clave(Debug_Access:string);
    var Eleccion:Byte; intercambio,repetir:Char;
    Begin
      debug_access:='';
      repetir:='N';
      Writeln('escriba "Admin" para ver el menú');
      Readln(Debug_Access);
      if Debug_Access='Admin' then
      Begin
      repeat
        Writeln('entraste al menú de Debug');
        Writeln('-------------------------Menu de Opciones-------------------------');
        Writeln('1:determina si los números iguales.');
        Writeln('2:determina si la clave es multiplo de de la piedra y viceversa.');
        Writeln('3:determina si números triangulares.');
        Writeln('4:determina si son números primos.');
        Writeln('5:determina si uno de los números está contenido en el otro.');
        Writeln('6:determina si uno de los números es el inverso del otro.');
        Writeln('7:determina si el número de la piedra es amigo del otro.');
        Writeln('------------------------------------------------------------------');
        Writeln('Indique su elección: ');
        Readln(Eleccion);
        case Eleccion of
          1:Begin
            repeat
            Numeros_Iguales(Clave_Jugador,Piedra);
            if (Numeros_Iguales(Clave_Jugador,Piedra))=true then Writeln('Los números son iguales') else Writeln('Los números no son iguales');
            Writeln('¿quieres cambiar las claves del Jugador y de la piedra?');
            Writeln('para si "Y" para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            until (intercambio='n');
          End;
          2:Begin
            repeat
            Numeros_Multiplo(Clave_Jugador,Piedra);
            if (Numeros_Multiplo(Clave_Jugador,Piedra))=true then Writeln('Los números son múltiplos') else Writeln('Los números no son múltiplos');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
          3:Begin
            repeat
              Triangular(Clave_Jugador,Piedra);
            if (Triangular(Clave_Jugador,Piedra))=true then Writeln('Los números son Triangulares') else Writeln('Los números no son triangulares');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
          4:Begin
            repeat
            Primos_Relativos(Clave_Jugador,piedra);
            if (Primos_Relativos(Clave_Jugador,Piedra))=true then Writeln('Los números son Primos relativos') else Writeln('Los números no son Primos Relativos');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
          5:Begin
            repeat
            Contenido(Clave_Jugador,Piedra);
            if (Contenido(Clave_Jugador,Piedra))=true then Writeln('Uno de los números está contenidos uno dentro del otro') else Writeln('Ninguno de los números esta contenido dentro del otro');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
          6:Begin
            repeat
            Inverso(Clave_Jugador,Piedra);
            if(Inverso(Clave_Jugador,Piedra))=true then Writeln('Los números son Inverso') else Writeln('Los números no son Inversos');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
          7:Begin
            repeat
            Amigo(Clave_Jugador,Piedra);
            if (Amigo(Clave_Jugador,Piedra))=true then Writeln('Los números son Amigos') else Writeln('Los números no son Amigos');
            Writeln('¿quiere cambiar la clave del jugador y piedra?');
            Writeln('para si "Y", para no "N"');
            Readln(intercambio);
            if intercambio='y' then
            begin
              Clave_Jugador:=CambiaClave(Clave_Jugador,'Jugador');
              piedra:=CambiaClave(piedra,'piedra');
            end;
            Until (intercambio='n');
          End;
        End;
        Writeln('quiere seleccionar otra opción del menú? escriba "n" para no y "y" para si');
        Readln(repetir);
        LowerCase(repetir);
      until (repetir='n');
      end;
    End;
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    begin
      Debug_Access:='';
      Menu_Clave(Debug_Access);
      if (numeros_iguales(Clave_Jugador,Piedra)) or (numeros_multiplo(Clave_Jugador,Piedra)) or (Triangular(Clave_Jugador,Piedra)) or (Contenido(Clave_Jugador,Piedra)) or (Inverso(Clave_Jugador,Piedra)) or (Amigo(Clave_Jugador,Piedra)) then
        Coincidencia_de_Clave:=true else Coincidencia_de_Clave:=False;
    end;
//=======================================================================================

Begin
  clrscr;
  Clave_Jugador:=CambiaClave(Clave_Jugador,'jugador');
  Piedra:=CambiaClave(Piedra,'Piedra');
  (*Escribir Admin para entrar al menú*)
  Coincidencia_de_Clave(Clave_Jugador,Piedra);
  if Coincidencia_de_Clave(Clave_Jugador,Piedra) then
  begin
    Writeln('El Personaje se Mueve');
  end
  else
  begin
    Writeln('El Personaje no se mueve');
  end;
  Writeln('llegaste al final del programa pricipal, hasta la próxima');
  Readln;
end.