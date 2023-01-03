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

const Max_Color=11;
limite=50;
type 
Datos=record
  Clave:LongInt;
  Color:Byte;
end;
Matriz=array[1..limite,1..limite] of Datos;

Var Jugador,Piedra:Datos;
Mapa: Matriz;

//Funcion para generar un Jugador/piedra al azar
function Rellenar_Jugador_Piedra(Actual:Datos):Datos;
begin
  Delay(1);
  randomize;
  Actual.Clave:=random(1000000);
  Actual.color:=Random(Max_Color);
  Rellenar_Jugador_Piedra:=Actual;
end;

//Función que me permite cambiar el valor de la clave del jugador o piedra
function CambiaClave(Clave:LongInt; Tipo:String): Integer;
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
function Digitos(N: LongInt): LongInt;
Var
  i: LongInt;
Begin
  i := 0;
  Repeat
    n := n Div 10;
    i := i+1;
  Until (n=0);
  Digitos := i;
End;
//=======================================================================================

//función que transforma numeros en String
function NumStr(num:LongInt): String;
Var
  p: String;
  i,n,c,cont: LongInt;
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

//Esta función determina si las claves del jugador y la piedra cumplen con alguno de los requisito para moverse
function Coincidencia_de_Clave(Clave_Jugador,piedra:Integer):Boolean;
  Var Debug_Access:String;
  // Esta función determina si los números son iguales
  function numeros_iguales(Clave_Jugador,Piedra:Integer):Boolean;
    Begin if (Clave_Jugador)<>(piedra) then numeros_iguales:=False; End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si la Clave es multiplo de la Piedra o viceversa
  function numeros_multiplo(Clave_Jugador,Piedra:Integer):Boolean;
    begin if (Clave_Jugador mod piedra =0) or (piedra mod Clave_Jugador =0) then Numeros_Multiplo:=True; end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el explorador tiene el número “n”, el número de la piedra es el n-ésimo número triangular, o viceversa.
  function Triangular(n,num:LongInt): Boolean;
  Var
    i,tri: LongInt;
    b: Boolean;
  Begin
    tri := 0;
    b := False;
    if n<Num Then
      Begin
        For i := 1 To N Do
          Begin
            tri := tri+i;
          End;
        if tri=num Then
          Begin
            b := True;
          End;
      End
    Else
      Begin
        For i := 1 To num Do
          Begin
            tri := tri+i;
          End;
        if tri=n Then
          Begin
            b := True;
          End;
      End;
    triangular := b;
  End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si son números primos relativos
  function Primos_Relativos(Clave_Jugador,piedra:Integer):Boolean;
  Var
    n1,n2,divisores,VarControl:Integer;
  begin
    divisores:=0;
    if (Clave_Jugador)>=(piedra) then begin n1:=Clave_Jugador; n2:=piedra; end else begin n2:=Clave_Jugador; n1:=piedra; end;
    for VarControl := 1 to n1 do
      begin
          if (n1 mod VarControl=0) and (n2 mod VarControl=0) then
            divisores := divisores + 1;
      end;
    if divisores = 1 then
      Primos_Relativos:=True{devuelve verdad si es primo}
    else
      Primos_Relativos:=False;{devuelve falso si no es primo}
  end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números está contenido en el otro.
  function Contenido(Num,N: LongInt): Boolean;
    Var
      p,m: String;
      i: LongInt;
      b: Boolean;
    Begin
      m:= NumStr(n);
      p:= NumStr(num);
      b:= False;
      if N<num Then
        Begin
          i:= pos(m,p);
          if (i<>0) Then
            Begin
              b:= True;
            End;
        End
      Else
        Begin
          i:= pos(p,m);
          if (i<>0) Then
            Begin
              b:= True;
            End;
        End;
      Contenido:=b
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números es el inverso del otro.
  function Inverso(n,num:LongInt): Boolean;
    Var
      b: Boolean;
      c,i,inv: LongInt;
    Begin
      inv:=0;
      c := Digitos(num);
      b := False;
      For i := 1 To c Do
        Begin
          inv:= (num Mod 10)+(inv*10);
          num:= num Div 10;
        End;
      if inv=n Then
        Begin
          b:= True;
        End;
      inverso:=b;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si son números amigos.
  function Amigo(num,n:LongInt): Boolean;
    Var
      n1,n2: LongInt;
      b: Boolean;
    //función para optimizar este proceso
    function SumaDivisores(n:LongInt): LongInt;
      Var
        i,suma: LongInt;
      Begin
        suma := 0;
        For i := 1 To (n) Do
          Begin
            if ((n Mod i)=0) Then
              Begin
                suma := suma+i;
              End;
          End;
        SumaDivisores := suma;
      End;
    Begin
      N1 := SumaDivisores(n)-N;
      n2 := SumaDivisores(num)-num;
      b := False;
      if (n1=num) And (n2=n) Then
        Begin
          B := True;
        End;
      amigo := b;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Este Procedure muestra un menú con todas las opciones para probarlas individualmente
  Procedure Menu_Clave(Debug_Access:String);
    Var Eleccion:Byte; intercambio,repetir:Char;
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
            if (Numeros_Iguales(Clave_Jugador,Piedra))=True then Writeln('Los números son iguales') else Writeln('Los números no son iguales');
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
            if (Numeros_Multiplo(Clave_Jugador,Piedra))=True then Writeln('Los números son múltiplos') else Writeln('Los números no son múltiplos');
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
            if (Triangular(Clave_Jugador,Piedra))=True then Writeln('Los números son Triangulares') else Writeln('Los números no son triangulares');
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
            if (Primos_Relativos(Clave_Jugador,Piedra))=True then Writeln('Los números son Primos relativos') else Writeln('Los números no son Primos Relativos');
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
            if (Contenido(Clave_Jugador,Piedra))=True then Writeln('Uno de los números está contenidos uno dentro del otro') else Writeln('Ninguno de los números esta contenido dentro del otro');
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
            if(Inverso(Clave_Jugador,Piedra))=True then Writeln('Los números son Inverso') else Writeln('Los números no son Inversos');
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
            if (Amigo(Clave_Jugador,Piedra))=True then Writeln('Los números son Amigos') else Writeln('Los números no son Amigos');
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
        Coincidencia_de_Clave:=True else Coincidencia_de_Clave:=False;
    end;
//=======================================================================================
//Función que transforma los colores de la profe a los colores de CRT
  Function Transformar_color(Color_Entrada:Byte): Byte;
  Begin
    Case Color_Entrada Of 
      0: Transformar_color := 7;
      1: Transformar_color := 15;
      2: Transformar_color := 14;
      3: Transformar_color := 2;
      4: Transformar_color := 6;
      5: Transformar_color := 1;
      6: Transformar_color := 5;
      7: Transformar_color := 0;
      8: Transformar_color := 13;
      9: Transformar_color := 4;
      10: Transformar_color := 12;
    End;
  End;
//=======================================================================================
//Esta función determina si los colores del jugador y la piedra cumplen con alguno de los requisito para moverse
  (*
    COINCIDENCIA DE EL COLOR
    Se asumirá la existencia de solo hasta 10 colores en la pared. Estos son;
    l Blanco 
    2 Amarillo 
    3 Verde 
    4 Marrón 
    5 Azul 
    6 Violeta 
    7 Negro 
    8 Rosado 
    9 Rojo 
    l0 Anaranjado 
    Si el color del explorador coincide con el de la piedra, ésta podrá ser parte del camino. Si el color no coincide, pero no
    se aleja más de dos posiciones de los colores posibles, ya sea, hacia arriba o hacia abajo en forma cíclica y en el orden
    especificado, también podrá seleccionarse esa piedra como parte del camino. Por ejemplo, si el explorador tiene el
    color rojo, los colores posibles de piedras para el camino serán: rojo, anaranjado, blanco, rosado o negro. ( Observación:
    establece en Pascal los colores que tengas disponibles no todos están presentes)
  *)
  { Colores de CRT
    • Black = 0 
    • Blue = 1 
    • Green = 2 
    • Cyan = 3 
    • Red = 4 
    • Magenta = 5 
    • Brown = 6 
    • LightGray = 7 
    • DarkGray = 8 
    • LightBlue = 9 
    • LightGreen = 10 
    • LightCyan = 11 
    • LightRed = 12 
    • LightMagenta= 13 
    • Yellow = 14 
    • White = 15 
  }
  function Coincidencia_de_Color(Color_Jugador,Color_Piedra:Byte):Boolean;
    function Colores_Iguales(Color_Jugador,Color_Piedra:Byte):Boolean;
    begin
      if Color_Jugador=Color_Piedra then
      begin
        Colores_Iguales:=True;
      end
      else
      begin
        Colores_Iguales:=False;
      end;
    end;
  begin
    if Colores_Iguales(Color_Jugador,Color_Piedra) and (Color_Piedra<>0) then
    begin
      Coincidencia_de_color:=true;
    end
    else
    begin
      Coincidencia_de_Color:=False
    end;
  end;
//=======================================================================================
//Esta función determina si se cumple algún requisito para moverse
function Te_Mueves(Jugador,Piedra:Datos):Boolean;
begin
  if Coincidencia_de_Clave(Jugador.Clave,Piedra.Clave) or coincidencia_de_Color(jugador.Color,Piedra.Color) then
  begin
    Te_Mueves:=True;
    Writeln('Por lo tanto El Personaje se Mueve');
  end
  else
  begin
    Te_Mueves:=False;
    Writeln('Por lo tanto El Personaje NO se mueve')
  end;
end;
//=======================================================================================
//Procedimiento que crea una matríz de forma interactiva
procedure Crear_Mapa_Interactivo(Mapa:Matriz);
Var
Y,X: Byte; caract:char;
  //Función que valida las dimensiones
    Function validarDimensiones(filcol,limi:Byte; mensaje:String): Byte;
    Begin
      writeln;
      Repeat
        writeln('Indicar ',mensaje,' de la matriz maxímo ', limite);
        readln(filcol);
        If (filcol<=1) Or (filcol>limi) Then
          writeln('Numero de ',mensaje,' invalidas');
      Until  (filcol>=2) And (filcol<=limi);
      validarDimensiones := filcol;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento que llena la matríz de forma Manual
    Procedure llenar_matriz_manual(Var m:matriz; fil,col:integer);
    Var 
      i,j: integer;
    Begin
      For i:=1 To fil Do
        Begin
          For j:=1 To col Do
            Begin
              writeln('indique la clave en la posicion: [',i, ' ' ,j,']');
              readln(m[i,j].Clave);
              writeln('indique color en la posicion: [',i, ' ' ,j,']');
              readln(m[i,j].Color);
            End;
        End;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento que llena la matríz de forma aleatoria
    Procedure llenar_matriz_random(Var m:matriz; fil,col:integer);
    Var 
      i,j: integer;
    Begin
      For i:=1 To fil Do
        Begin
          For j:=1 To col Do
            Begin
              m[i,j]:=Rellenar_Jugador_Piedra(Piedra);
            End;
        End;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Pocedimiento para imprimir matriz
    Procedure imprimir_matriz(m:matriz; fil,col:integer);
    Var 
      i,j: integer;
    Begin
      writeln;
      writeln('Contenido de la Matriz: ');
      For i:=1 To fil Do
        Begin
          For j:=1 To col Do
            Begin
              TextBackground(Transformar_color(m[i,j].Color));
              write((m[i,j].clave):6,'  ');
            End;
          TextBackground(0);
          writeln;
        End;
    End;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
begin
  Y:= validarDimensiones(Y,limite,'altura');
  X:= validarDimensiones(X,limite,'ancho');
  repeat
    writeln('Como desea rellenar la matriz. Indique r para random y m para manual');
    Readln(caract);
    caract:= upcase(caract);
    case caract of
      'R':begin
        llenar_matriz_random(Mapa,Y,X);
      end;
      'M':begin
        llenar_matriz_manual(Mapa,Y,X);
      end;
    else
    begin
      writeln('Su respuesta no es valida, intente de nuevo');
    end;
    End;
  Until((caract='M') or (caract='R'));
  imprimir_matriz(Mapa,Y,X);
end;
//=======================================================================================
//Procedimiento que maneja al jugador
  procedure Jugador_Funcionamiento(var Jugador:Datos; Var Mapa:Matriz);
  //movimiento prueba
  
  begin
    if Te_Mueves(Jugador,Piedra); then
    begin
      sound(200);
      Delay(500);
      NoSound;
    end;
  end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  begin
    
  end;
//=======================================================================================

Begin
  clrscr;
  Crear_Mapa_Interactivo(Mapa);
  Jugador.Clave:=CambiaClave(Jugador.Clave,'clave de jugador');
  Piedra.Clave:=CambiaClave(Piedra.Clave,'clace de Piedra');
  Jugador.Color:=CambiaClave(Jugador.Clave,'color de jugador');
  Piedra.Color:=CambiaClave(Piedra.Clave,'color de Piedra');
  (*Escribir Admin para entrar al menú*)
  if Coincidencia_de_Clave(Jugador.Clave,Piedra.Clave) then
  begin
    Writeln('El Personaje se Mueve por la Clave');
  end
  else
  begin
    Writeln('El Personaje no se mueve');
  end;
    if Coincidencia_de_Color(Jugador.Color,Piedra.Color) then
  begin
    Writeln('El Personaje se Mueve por el color');
  end
  else
  begin
    Writeln('El Personaje no se mueve');
  end;
  Te_Mueves(Jugador,Piedra);
  Writeln('llegaste al final del programa pricipal, hasta la próxima');
  Readln;
end.