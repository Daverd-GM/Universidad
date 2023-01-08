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
limite=20;
type 
Datos=record
  Clave:LongInt;
  Color:Byte;
  Spawn:Boolean;
end;
Matriz=array[1..(limite+3),1..(limite+3)] of Datos;
Var
  Jugador1, Jugador2,Piedra:Datos;
  Copia_Mapa,  Mapa: Matriz;
  X,Y,Bolso1,bolso2: Byte;
  Mapa_Entrada:text;
//Procedimiento para Pasar de Caracteres a Números Longint
  procedure Caracter_a_Numero_Long(Caracter:char; Var Numero:LongInt);
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
//Funcion para generar un Jugador/piedra al azar
function Rellenar_Jugador_Piedra(Actual:Datos):Datos;
begin
  Delay(1);
  randomize;
  Actual.Clave:=random(100000);
  Actual.Color:=Random(Max_Color);
  Actual.Spawn:=False;
  Rellenar_Jugador_Piedra:=Actual;
end;
//Función que me permite cambiar el valor de la clave del jugador o piedra
function CambiaDatos(Actual:Datos; tipo:String):Datos;
begin
  Writeln('Escriba la clave de', tipo);
  Readln(Actual.Clave);
  Writeln('Escriba el color de', tipo);
  Readln(Actual.Color);
  Actual.Spawn:=False;
  CambiaDatos:=Actual;
end;
//=======================================================================================
//Función que me permite cambiar el valor de la clave del jugador o piedra
function CambiaClave(Clave:LongInt; Tipo:String): Integer;
begin
  repeat
    Writeln('Inserte el valor para ',tipo);
    Readln(Clave);
    if clave<0 then
    begin
      Writeln('El valor de la clave debe de ser mayor o igual a 0')
    end;
  until (clave>=0);
  CambiaClave:=Clave;
end;
//=======================================================================================
//función que calcula la cantidad de digitos de un número
function Digitos(N: LongInt): LongInt;
Var
  i: LongInt;
begin
  i := 0;
  Repeat
    n := n Div 10;
    i := i+1;
  Until (n=0);
  Digitos := i;
end;
//=======================================================================================
//función que transforma numeros en String
function NumStr(num:LongInt): String;
Var
  p: String;
  i,n,c,cont: LongInt;
begin
  p := '';
  i := num;
  cont := digitos(num);
  For c := 1 To cont Do
    begin
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
      end;
      i := i Div 10;
    end;
  NumStr := p;
end;
//=======================================================================================
//Esta función determina si las claves del jugador y la piedra cumplen con alguno de los requisito para moverse
function Coincidencia_de_Clave(Clave_Jugador,piedra:Integer):Boolean;
  //Var Debug_Access:String;
  // Esta función determina si los números son iguales
  function numeros_iguales(Clave_Jugador,Piedra:Integer):Boolean;
    begin if (Clave_Jugador)<>(piedra) then numeros_iguales:=False; end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si la Clave es multiplo de la Piedra o viceversa
  function numeros_multiplo(Clave_Jugador,Piedra:Integer):Boolean;
    begin
      if (Piedra=0) or (Clave_Jugador=0) then
        numeros_multiplo:=False
      else
      begin
        if (Clave_Jugador mod piedra =0) or (piedra mod Clave_Jugador =0) then Numeros_Multiplo:=True;
      end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si el explorador tiene el número “n”, el número de la piedra es el n-ésimo número triangular, o viceversa.
  function Triangular(n,num:LongInt): Boolean;
  Var
    i,tri: LongInt;
    b: Boolean;
  begin
    tri := 0;
    b := False;
    if n<Num Then
      begin
        For i := 1 To N Do
          begin
            tri := tri+i;
          end;
        if tri=num Then
          begin
            b := True;
          end;
      end
    else
      begin
        For i := 1 To num Do
          begin
            tri := tri+i;
          end;
        if tri=n Then
          begin
            b := True;
          end;
      end;
    triangular := b;
  end;
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
    begin
      m:= NumStr(n);
      p:= NumStr(num);
      b:= False;
      if N<num Then
        begin
          i:= pos(m,p);
          if (i<>0) Then
            begin
              b:= True;
            end;
        end
      else
        begin
          i:= pos(p,m);
          if (i<>0) Then
            begin
              b:= True;
            end;
        end;
      Contenido:=b
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Esta función determina si uno de los números es el inverso del otro.
  function Inverso(n,num:LongInt): Boolean;
    Var
      b: Boolean;
      c,i,inv: LongInt;
    begin
      inv:=0;
      c := Digitos(num);
      b := False;
      For i := 1 To c Do
        begin
          inv:= (num Mod 10)+(inv*10);
          num:= num Div 10;
        end;
      if inv=n Then
        begin
          b:= True;
        end;
      inverso:=b;
    end;
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
      begin
        suma := 0;
        For i := 1 To (n) Do
          begin
            if ((n Mod i)=0) Then
              begin
                suma := suma+i;
              end;
          end;
        SumaDivisores := suma;
      end;
    begin
      N1 := SumaDivisores(n)-N;
      n2 := SumaDivisores(num)-num;
      b := False;
      if (n1=num) And (n2=n) Then
        begin
          B := True;
        end;
      amigo := b;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  {// Este procedure muestra un menú con todas las opciones para probarlas individualmente
  procedure Menu_Clave(Debug_Access:String);
    Var Eleccion:Byte; intercambio,repetir:Char;
    begin
      debug_access:='';
      repetir:='N';
      Writeln('escriba "Admin" para ver el menú');
      Readln(Debug_Access);
      if Debug_Access='Admin' then
      begin
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
          1:begin
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
          end;
          2:begin
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
          end;
          3:begin
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
          end;
          4:begin
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
          end;
          5:begin
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
          end;
          6:begin
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
          end;
          7:begin
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
          end;
        end;
        Writeln('quiere seleccionar otra opción del menú? escriba "n" para no y "y" para si');
        Readln(repetir);
        LowerCase(repetir);
      until (repetir='n');
      end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
    begin
    {Debug_Access:='';
    Menu_Clave(Debug_Access);}
      if (numeros_iguales(Clave_Jugador,Piedra)) or (numeros_multiplo(Clave_Jugador,Piedra)) or (Triangular(Clave_Jugador,Piedra)) or (Primos_relativos(Clave_Jugador,Piedra)) or (Contenido(Clave_Jugador,Piedra)) or (Inverso(Clave_Jugador,Piedra)) or (Amigo(Clave_Jugador,Piedra)) then
        Coincidencia_de_Clave:=True else Coincidencia_de_Clave:=False;
    end;
//=======================================================================================
//Función que transforma los colores de la profe a los colores de CRT
  function Transformar_color(Color_Entrada:Byte): Byte;
  begin
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
    end;
  end;
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
        Colores_Iguales:=True
      else
        Colores_Iguales:=False;
    end;
    function Variedad_Colores(Color_Jugador,Color_Piedra:Byte):Boolean;
    begin
      case Color_Jugador of
        1: begin
          if (Color_Piedra=10) or (Color_Piedra=9) or (Color_Piedra-2=Color_Jugador) or (Color_Piedra-1=Color_Jugador) then
            Variedad_Colores:=true
          else
            Variedad_Colores:=false          
        end;
        2: begin
          if (Color_Piedra=10) or (Color_Piedra-1=Color_Jugador) or (Color_Piedra+1=Color_Jugador) or (Color_Piedra+2=Color_Jugador) then
            Variedad_Colores:=true
          else
            Variedad_Colores:=false          
        end;
        3..8: begin
          if (Color_Piedra-2=Color_Jugador) or (Color_Piedra-1=Color_Jugador) or (Color_Piedra+1=Color_Jugador) or (Color_Piedra+2=Color_Jugador) then
            Variedad_Colores:=true
          else
            Variedad_Colores:=false          
        end;
        9: begin
          if (Color_Piedra-2=Color_Jugador) or (Color_Piedra-1=Color_Jugador) or (Color_Piedra+1=Color_Jugador) or (Color_Piedra=1) then
            Variedad_Colores:=true
          else
            Variedad_Colores:=false          
        end;
        10: begin
          if (Color_Piedra-2=Color_Jugador) or (Color_Piedra-1=Color_Jugador) or (Color_Piedra=1) or (Color_Piedra=2) then
            Variedad_Colores:=true
          else
            Variedad_Colores:=false          
        end;
      end;
    end;
  begin
    if Colores_Iguales(Color_Jugador,Color_Piedra) or Variedad_Colores(Color_Jugador,Color_Piedra) then
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
    if (Coincidencia_de_Clave(jugador.Clave,Piedra.Clave) or coincidencia_de_Color(jugador.Color,Piedra.Color)) and (Piedra.Color<>0) then
    begin
      Te_Mueves:=True;
    end
    else
    begin
      Te_Mueves:=False;
    end;
  end;
//=======================================================================================
//Pocedimiento para imprimir matriz
    procedure imprimir_matriz(m:matriz; fil,col:Integer);
    Var 
      i,j: Integer;
    begin
      clrscr;
      writeln;
      For j:=2 To (col+1) Do
      begin
        If (m[1,j].spawn=false) Then
          begin
            TextBackground(0);
            write('     ');
            TextBackground(0);
          end
        else
          begin
            write('  ¤  ');
          end;
      end;
      writeln;
      For i:=2 To (fil+1) Do
        begin
          For j:=2 To (col+1) Do
            begin
              if (m[i,j].Color=0) or (m[i,j].spawn) then
              begin
                TextBackground(Transformar_color(m[i,j].Color));
                write('     ');
                TextBackground(0);
              end
              else
              begin
                TextBackground(Transformar_color(m[i,j].Color));
                write((m[i,j].Clave): 5);
                TextBackground(0);
              end;
              
            end;
          writeln;
        end;
      For j:=2 To (col+1) Do
      begin
        If (m[fil+2,j].spawn) Then
          begin
          TextBackground(0);
          write('     ');
          TextBackground(0);
          end
        else
          begin
          TextBackground(Transformar_color(m[fil+2,j].Color));
          write((m[fil+2,j].Clave): 5);
          TextBackground(0);
          end;
      end;
      writeln;
    end;
//=======================================================================================
  //spawn del jugador
    procedure Spawn_Jugador1(Var mapa:Matriz; Jugador:Datos);
    begin
      mapa[Y+2,2]:= jugador;
    end;
  //++++++++++++++++++++++++++++++++++++++++++++++++
//spawn del jugador
  procedure Spawn_Jugador2(Var mapa:Matriz; Jugador:Datos);
  begin
    mapa[Y+2,X+1]:=jugador;
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++
//procedimiento de spawns
  procedure Spawn(Var Mapa:Matriz; Jugador1, Jugador2:Datos);
  procedure morral(bolso:byte; Var mapa:matriz);
  begin
    mapa[1,bolso+1].spawn:=true;
    mapa[1,bolso+1].clave:=1;
    mapa[1,bolso+1].color:=7;
  end;
  begin
    Spawn_Jugador1(Mapa,Jugador1);
    Spawn_Jugador2(Mapa,Jugador2);
    morral(bolso1,mapa);
    morral(bolso2,mapa);
    imprimir_matriz(mapa,Y,X)
  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Procedimiento que llena la Matriz por Archivos
  procedure VerArchivoenPantalla(Var Entrada:text ;Mapa:Matriz;X,Y:Byte);
  Var
    CH:Char;
    
  Begin
    Reset(entrada);
    //primera linea, Dimensiones de la matriz
    repeat
      read(Entrada,CH);
    until (CH='(');      
    repeat
      read(entrada,CH);
      Caracter_a_Nuemero(Ch,X);
    until (CH=',') or (Ch=')') or (eoln(Entrada));

    Repeat
    read(entrada,CH);
    Caracter_a_Nuemero(Ch,Y);
    Until (CH=')') or (eoln(Entrada));
    Readln(entrada,Ch);
  //Segunda linea, bolsos
    if (Ch='(') then
    begin
      Repeat
        read(entrada,CH);
        Caracter_a_Nuemero(Ch,Bolso1);
      until (CH=',') or (Ch=')') or (eoln(Entrada));
      Repeat
        read(entrada,CH);
        Caracter_a_Nuemero(Ch,Bolso2);
       Until (CH=')') or (eoln(Entrada));
      Readln(entrada,Ch);
    end
    else
    begin
      Repeat
        read(Entrada,CH);
      Until (CH='(');
      Repeat
        read(entrada,CH);
        Caracter_a_Nuemero(Ch,Bolso1);
      until (CH=',') or (Ch=')') or (eoln(Entrada));

      Repeat
        read(entrada,CH);
        Caracter_a_Nuemero(Ch,Bolso2);
       Until (CH=')') or (eoln(Entrada));
      Readln(entrada,Ch);
    end;
    Close(entrada);
  End;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Procedimiento que crea una matríz de forma interactiva
  procedure Crear_Mapa_Interactivo(Var Mapa:Matriz; Var X,Y,Bolso1,Bolso2: Byte);
  Var
  caract:char;
  //Función que valida las dimensiones
    function validarDimensiones(filcol,limi:Byte; mensaje:String): Byte;
    begin
      writeln;
      Repeat
        writeln('Indicar ',mensaje,' de la matriz maxímo ', limite);
        readln(filcol);
        filcol:=filcol;
        if (filcol<=1) Or (filcol>limi) Then
          writeln('Numero de ',mensaje,' invalidas');
      Until  (filcol>=2) And (filcol<=limi);
      validarDimensiones := filcol;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento que llena la matríz de forma Manual
    procedure llenar_matriz_manual(Var m:matriz; Var fil,col:byte);
    Var 
      i,j: Integer;
    begin
      fil := validarDimensiones(fil,limite,'altura');
      col := validarDimensiones(col,limite,'ancho');
      For i:=2 To (fil+1) Do
        begin
          For j:=2 To (col+1) Do
            begin
              writeln('indique la clave en la posicion: [',i, ' ' ,j,']');
              readln(m[i,j].Clave);
              writeln('indique color en la posicion: [',i, ' ' ,j,']');
              readln(m[i,j].Color);
            end;
        end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento que llena la matríz de forma aleatoria
    procedure llenar_matriz_random(Var m:matriz; Var fil,col:byte);
    Var 
      i,j: Integer;
    begin
    fil := validarDimensiones(fil,limite,'altura');
    col := validarDimensiones(col,limite,'ancho');
      For i:=2 To (fil+1) Do
        begin
          For j:=2 To (col+1) Do
            begin
              m[i,j]:=Rellenar_Jugador_Piedra(Piedra);
            end;
        end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  //Proceddimiento de recolecta de datos manual del bolso
  procedure Bolso_manual(X,T:byte; Var bolso:byte);
  begin
    repeat
      Writeln('Indique coordenada X del bolso ',T);
      readln(bolso);
      If (bolso<=0) or (bolso>X) then
      writeln('Dato no valido, por favor vuelva a intentar');
    until ((bolso<=X) and (bolso>=1));
  end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento que pone los bordes
    procedure Bordes(Var m:matriz; fil,col:Integer);
    Var
      i: Integer;
    begin
      for i := 1 to col+2 do
      begin
        m[1,i].Clave:=1; m[1,i].Color:=0; m[1,i].spawn:=false;//arriba
      end;
      for i := 1 to fil+3 do
      begin
        m[i,1].Clave:=1; m[i,1].Color:=0;//izquierda
      end;
      for i := 1 to col+2 do
      begin
        m[fil+3,i].Clave:=1; m[fil+3,i].Color:=0;//abajo
      end;
      for i := 1 to fil+3 do
      begin
        m[i,col+2].Clave:=1; m[i,col+2].Color:=0;//derecha
      end;
      for i := 2 to col+1 do
      begin
        m[fil+2,i].Clave:=1; m[fil+2,i].Color:=7; m[fil+2,i].spawn:=true;//spawn
      end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  begin
  repeat
    writeln('Como desea rellenar la matriz. Indique R para random, A para archivo y M para manual');
    Readln(caract);
    caract:= upcase(caract);
    case caract of
      'R':begin
        llenar_matriz_random(Mapa,Y,X);
        Bordes(Mapa,Y,X);
        Bolso_manual(X,1,bolso1);
        Bolso_manual(X,2,bolso2);
        Jugador1 := CambiaDatos(Jugador1,'l jugador 1');
        Jugador2 := CambiaDatos(Jugador2,'l jugador 2');
        imprimir_matriz(Mapa,Y,X);
      end;
      'M':begin
        llenar_matriz_manual(Mapa,Y,X);
        Bordes(Mapa,Y,X);
        Bolso_manual(X,Y,bolso1);
        Bolso_manual(X,Y,bolso2);
        Jugador1 := CambiaDatos(Jugador1,'l jugador 1');
        Jugador2 := CambiaDatos(Jugador2,'l jugador 2');
        imprimir_matriz(Mapa,Y,X);
      end;
      'A':begin
        Writeln('Debe de indicar cada dato que introduzca en el archivo entre parentesis y separados por una coma, sin espacios Ejemplo: (8,9) Y recuerde que primero Indica las dimensiones del mapa, luego la posicion x de los bolsos (igualmente entre un parentesis ambos y separados por una coma) Y por último los datos de cada piedra primero color, luego la clave y solo una piedra por linea Para efectos visuales trate de no sobrepasar los 5 digitos en las claves de las piedras');
        readkey;
      end;
    else
    begin
      writeln('Su respuesta no es valida, intente de nuevo');
    end;
    end;
  Until((caract='M') or (caract='R'));
  spawn(mapa,Jugador1,Jugador2);
  Copia_Mapa:=Mapa;
  imprimir_matriz(Mapa,Y,X);
  end;
//=======================================================================================
//Procedimiento que maneja al jugador
  procedure Jugador_Funcionamiento(Var Mapa:Matriz);
  Var
  Victoria: Boolean; Derrota: Boolean; Comida:Boolean;
  //Procedimiento de pantalla de Derrota
    procedure Pantalla_Derrota(Mapa:Matriz);
    begin
    clrscr;
    Writeln('Perdieron Buena suerte la proxima vez');
    end;
  //=======================================================================================
  //Procedimiento de pantalla de Victoria
    procedure Pantalla_Victoria(Mapa:Matriz; Var comida:Boolean);
    begin
    clrscr;
    Writeln('ganaron felizidades'); Comida:=true;
    end;
  //=======================================================================================
  //Procedimiento de condicion de victoria
    function ganaste(MovY,MovX:Byte; Mapa:Matriz):Boolean;
    begin
      if (MovY=1) and ((MovX=(Bolso1+1)) or (movX=(Bolso2+1))) then
      begin
        Pantalla_Victoria(Mapa,comida); Victoria:=True;
      end
      else
      begin
        Victoria:=false;
      end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Procedimiento de condicion de derrota
    function Perdiste(Var Caidas:Byte):Boolean;
    begin
      if Caidas<=2 then
      begin
        Caidas:=Caidas+1;
        perdiste:=false;
      end
      else
        begin
          Perdiste:=True; Pantalla_Derrota(Mapa);
        end;
    end;
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //movimiento prueba
    procedure Movimiento(Var Mapa:Matriz);
    Var
    Charac:char; MovX1,MovY1,MovY2,MovX2 :byte; Caidas1, Caidas2:byte; piedra_tropezada:Datos; ex:Longint;
    //trepó
      procedure Trepada(Var mapa:Matriz; MovY,MovX:Byte;Jugador:Datos);
      begin
        Victoria:=False;
        sound(1000);
        Delay(500);
        nosound;
        mapa[MovY,MovX].Color:=jugador.Color;
        mapa[MovY,MovX].Clave := jugador.Clave;
        mapa[MovY,MovX].spawn:=true;
        imprimir_matriz(mapa,Y,X);  
        GOTOXY((((MovX-1)*5)-2),MovY+1); 
        Victoria:=ganaste(MovY,MovX,Mapa);  
      end;
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    //golpe
      procedure Golpe(piedra_nueva:datos; Var caida:byte);
      begin
        if (piedra_tropezada.clave=Piedra_Nueva.clave) and (piedra_tropezada.color=piedra_nueva.color)then
        begin
          Mapa:=Copia_Mapa;
          Spawn(Mapa,JUgador1,Jugador2);
          MovX1 := 2;
          MovY1 := Y+2;
          MovX2 := X+1;
          MovY2 := Y+2;
          piedra_tropezada.Color := 99;
          piedra_tropezada.Clave := -10;
          Derrota:=Perdiste(Caida);
        end
        else
        begin
        piedra_tropezada:=piedra_nueva;
        sound(200);
        Delay(500);
        nosound;
        end; 
      end;
    //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    begin
      MovX1:=2; MovY1:=Y+2; MovX2:= X+1; MovY2 := Y+2; Caidas1:=0; Caidas2:= 0; piedra_tropezada.Color:=99; piedra_tropezada.Clave:=-10;
      repeat        
        repeat
          repeat            
          until (KeyPressed);
          Charac:=ReadKey;
        until ((Charac='w') or (Charac='a') or (Charac='s') or (Charac='d') or (Charac='i') or (Charac='l') or (Charac='k') or (Charac='j'));
        Victoria:=false;
        case Charac of
          'w':begin
            if te_Mueves(Jugador1,mapa[MovY1-1,MovX1]) then
            begin
              MovY1:=MovY1-1;
              Trepada(mapa,MovY1,MovX1,Jugador1);
            end
            else
            begin
              Golpe(mapa[MovY1-1,MovX1],Caidas1);
            end;          
          end;
          'a':begin
            if te_Mueves(Jugador1,mapa[MovY1,MovX1-1]) Then
            begin
              if MovY1<>Y+2 then
              begin
              MovX1 := MovX1-1;
              Trepada(mapa,MovY1,MovX1,Jugador1);
              end
              else
              begin
                mapa[MovY1,MovX1].Color := 7;
                mapa[MovY1,MovX1].Clave := 1;
                mapa[MovY1,MovX1].Spawn := true;
                MovX1 := MovX1-1;
                mapa[MovY1,MovX1].Color := Jugador1.Color;
                mapa[MovY1,MovX1].Clave := Jugador1.Clave;
                mapa[MovY1,MovX1].spawn := Jugador1.spawn;
                imprimir_matriz(mapa,Y,X);
                GOTOXY((((MovX1-1)*5)-2),MovY1+1);
              end;
            end           
            else
              begin
                Golpe(mapa[MovY1,MovX1-1],Caidas1);
              end;          
          end;
          's':begin
            if te_Mueves(Jugador1,mapa[MovY1+1,MovX1]) Then
              begin
              MovY1 := MovY1+1;
              Trepada(mapa,MovY1,MovX1,Jugador1);
              end
            else
              begin
                Golpe(mapa[MovY1+1,MovX1],Caidas1);
              end;
          end;
          'd':begin
            if te_Mueves(Jugador1,mapa[MovY1,MovX1+1]) Then
              begin
                If MovY1<>Y+2 Then
                  begin
                  MovX1 := MovX1+1;
                  Trepada(mapa,MovY1,MovX1,Jugador1);
                  end
                else
                  begin
                  mapa[MovY1,MovX1].Color := 7;
                  mapa[MovY1,MovX1].Clave := 1;
                  mapa[MovY1,MovX1].Spawn := true;
                  MovX1 := MovX1+1;
                  mapa[MovY1,MovX1].Color := Jugador1.Color;
                  mapa[MovY1,MovX1].Clave := Jugador1.Clave;
                  mapa[MovY1,MovX1].spawn := Jugador1.spawn;
                  imprimir_matriz(mapa,Y,X);
                  GOTOXY((((MovX1-1)*5)-2),MovY1+1);
                  end;
              end
            else
              begin
                Golpe(mapa[MovY1,MovX1+1],Caidas1);
              end;
          end;
          'i':begin
            if te_Mueves(jugador2,mapa[MovY2-1,MovX2]) then
            begin
              MovY2:=MovY2-1;
              Trepada(mapa,MovY2,MovX2,Jugador2);
            end
            else
            begin
              Golpe(mapa[MovY2-1,MovX2],Caidas2);
            end;          
          end;
          'j':begin
            if te_Mueves(jugador2,mapa[MovY2,MovX2-1]) Then
            begin
              if MovY2<>Y+2 then
              begin
              MovX2 := MovX2-1;
              Trepada(mapa,MovY2,MovX2,Jugador2);
              end
              else
              begin
                mapa[MovY2,MovX2].Color := 7;
                mapa[MovY2,MovX2].Clave := 1;
                mapa[MovY2,MovX2].Spawn := true;
                MovX2 := MovX2-1;
                mapa[MovY2,MovX2].Color := jugador2.Color;
                mapa[MovY2,MovX2].Clave := jugador2.Clave;
                mapa[MovY2,MovX2].spawn := jugador2.spawn;
                imprimir_matriz(mapa,Y,X);
                GOTOXY((((MovX2-1)*5)-2),MovY2+1);
              end;
            end           
            else
              begin
                Golpe(mapa[MovY2,MovX2-1],Caidas2);
              end;          
          end;
          'k':begin
            if te_Mueves(jugador2,mapa[MovY2+1,MovX2]) Then
              begin
                MovY2 := MovY2+1;
                Trepada(mapa,MovY2,MovX2,Jugador2);
              end
            else
              begin
                Golpe(mapa[MovY2+1,MovX2],Caidas2);
              end;
          end;
          'l':begin
            if te_Mueves(jugador2,mapa[MovY2,MovX2+1]) Then
              begin
                If MovY2<>Y+2 Then
                  begin
                  MovX2 := MovX2+1;
                  Trepada(mapa,MovY2,MovX2,Jugador2);
                end
                else
                  begin
                  mapa[MovY2,MovX2].Color := 7;
                  mapa[MovY2,MovX2].Clave := 1;
                  mapa[MovY2,MovX2].Spawn := true;
                  MovX2 := MovX2+1;
                  mapa[MovY2,MovX2].Color := jugador2.Color;
                  mapa[MovY2,MovX2].Clave := jugador2.Clave;
                  mapa[MovY2,MovX2].spawn := jugador2.spawn;
                  imprimir_matriz(mapa,Y,X);
                  GOTOXY((((MovX2-1)*5)-2),MovY2+1);
                  end;
              end
            else
              begin
                Golpe(mapa[MovY2,MovX2+1],Caidas2);
              end;
          end;
        end;
        
      until((Derrota)or(comida));
    end;
    
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  begin
  Derrota:=false;
  Victoria:=false;
  comida:=false;
  Movimiento(mapa);
    
  end;
//=======================================================================================
begin
  assign(Mapa_Entrada,'C:\Datos\Entrada.txt');
  clrscr;
  TextBackground(0);
  Crear_Mapa_Interactivo(Mapa,X,Y,Bolso1,Bolso2);
  Jugador_Funcionamiento(Mapa);
  {Jugador1 := CambiaDatos(Jugador1,'l jugador 1');
  Piedra := CambiaDatos(Jugador2,'l jugador 2');
  (*Escribir Admin para entrar al menú*)
  if Coincidencia_de_Clave(Jugador1.Clave,Piedra.Clave) then
  begin
    Writeln('Hay coincidencia de clave');
  end
  else
  begin
    if Coincidencia_de_Color(Jugador1.Color,Piedra.Color) then
    begin
      Writeln('Hay coincidencia de color');
    end
    else
    begin
      Writeln('No hay coincidencia de ningun tipo');
    end;
  end; 
  Te_Mueves(Jugador1,Piedra);}
  Writeln('llegaste al final del programa pricipal, hasta la próxima');
  ReadKey;
end.
{Fuí al baño}