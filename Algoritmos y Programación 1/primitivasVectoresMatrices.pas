
Program primitivas;

Const 
  limite = 200;
  filas = 100;
  columnas = 150;

Type 
  matriz = array[1..filas,1..columnas] Of integer;
  vector = array[1..limite] Of integer;

Var 
  m: matriz;
  v: vector;
  fil,col,n: integer;

Function validarDimensiones(filcol,limi:integer; mensaje:String): integer;
Begin
  writeln;
  Repeat
    writeln('Indica cantidad de ',mensaje,'--->');
    readln(filcol);
    If (filcol<2) Or (filcol>limi) Then
      writeln('Numero de ',mensaje,' invalidas');
  Until  (filcol>=2) And (filcol<=limi);
  validarDimensiones := filcol;
End;


Procedure llenar_vector_manual(Var v:vector; n:integer);

Var 
  i: integer;
Begin
  For i:=1 To n Do
    Begin
      writeln('indique valor posicion: ',i);
      readln(v[i]);
    End;
End;

Procedure llenar_vector_random(Var v:vector; n:integer);

Var 
  i: integer;
Begin
  randomize;
  For i:=1 To n Do
    Begin
      v[i] := random(100) + 1;
    End;
End;

Procedure imprimir_vector(v:vector; n:integer);

Var 
  i: integer;
Begin
  writeln;
  writeln('Contenido del vector: ');
  For i:=1 To n Do
    Begin
      write(v[i],'  ');
    End;
End;


Procedure llenar_matriz_manual(Var m:matriz; fil,col:integer);

Var 
  i,j: integer;
Begin
  For i:=1 To fil Do
    Begin
      For j:=1 To col Do
        Begin
          writeln('indique valor posicion: [',i, ' ' ,j,']');
          readln(m[i,j]);
        End;
    End;
End;

Procedure llenar_matriz_random(Var m:matriz; fil,col:integer);

Var 
  i,j: integer;
Begin
  randomize;
  For i:=1 To fil Do
    Begin
      For j:=1 To col Do
        Begin
          m[i,j] := random(100)+1;
        End;
    End;
End;


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
          write(m[i,j],'  ');
        End;
      writeln;
    End;
End;

Begin
  n := validarDimensiones(n,limite,'casillas');
  llenar_vector_random(v,n);
  imprimir_vector(v,n);
  fil := validarDimensiones(fil,filas,'filas');
  col := validarDimensiones(col,columnas,'columnas');
  llenar_matriz_random(m,fil,col);
  imprimir_matriz(m,fil,col);
  readln;
End.