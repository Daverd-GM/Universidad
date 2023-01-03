
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

Uses crt;

const Max_Color=10;

type 
Datos=record
  Clave:LongInt;
  Color:Byte;
end;

Var Jugador,Piedra:Datos;

//Funcion para generar un Jugador al azar
  function Rellenar_Jugador_Piedra(Actual:Datos):Datos;
  begin
    Delay(500);
    randomize;
    Actual.Clave:=random(1000)+2;
    Actual.color:=Random(Max_Color)+1;
    Rellenar_Jugador_Piedra:=Actual;
  end;
//Procedimiento para mostrar valores
  procedure Mostrar(x:Datos;y:String);
  begin
    Writeln('La Clave de', y ,' es: ', x.Clave);
    Writeln('El Color de', y ,' es: ', x.Color);
  end;
//Función que determina si los colores cumplen con los requisitos
  function Coincidencia_de_Color(Color_Jugador,Color_Piedra:Byte):Boolean;
    function Colores_Iguales(Color_Jugador,Color_Piedra:Byte):Boolean;
    begin
      if Color_Jugador=Color_Piedra then
        Colores_Iguales:=True
      else
        Colores_Iguales:=False;
    end;
    function Colores_Varian(Color_Jugador,Color_Piedra:Byte):Boolean;
    Type Colores= 'Blanco','Amarillo','Verde','Marron','Azul','Violeta','Negro','Rosado','Rojo','Anaranjado';
    begin
      
    end;
  begin
    if Colores_Iguales(Color_Jugador,Color_Piedra) then
    begin
      Coincidencia_de_color:=true;
    end
    else
    begin
      Coincidencia_de_Color:=False;
    end;
  end;
begin
  Jugador:=Rellenar_Jugador_Piedra(Jugador);
  Mostrar(Jugador,'l Jugador');
  Piedra:=Rellenar_Jugador_Piedra(Piedra);
  Mostrar(Piedra,' la Piedra');
end.