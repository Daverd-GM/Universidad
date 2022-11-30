
Program proyecto;

Var 
  n1,n2,op: longint;
  bool: boolean;
  //funciones utiles para los procesos

Function Digitos(N: longint): longint;
//funcion que calcula la cantidad de digitos de un número

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

Function NumStr(num:longint): String;
//funcion que transforma numeros en string

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

Function Contenido(Num,N: longint): boolean;
// Esta funcion determina si un numero esta contenido en otro

Var 
  p,m: string;
  i: longint;
  b: boolean;
Begin
  m := NumStr(n);
  p := NumStr(num);
  b := false;
  If N<num Then
    Begin
      i := pos(m,p);
      If (i<>0) Then
        Begin
          b := true;
        End;
    End
  Else
    Begin
      i := pos(p,m);
       If (i<>0) Then
         Begin
           b := true;
         End;
    End;
End;

Function Inverso(n,num:longint): boolean;
//funcion que te indica si un numero es el inverso del otro

Var 
  b: boolean;
  c,i,inv: longint;
Begin
  c := digitos(num);
  b := false;
  For i := 1 To c Do
    Begin
      inv := (num Mod 10)+(inv*10);
      num := num Div 10;
    End;
  If inv=n Then
    Begin
      b := true;
    End;
  inverso := b;
End;

Function Amigo(num,n:longint): boolean;
//función que te indica si dos numeros son amigos

Var 
  n1,n2: longint;
  b: boolean;

 Function SumaDivisores(n:longint): longint;
//funcion para optimizar este proceso

 Var 
   i,suma,d: longint;
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


Function Triangular(n,num:longint): boolean;
//funcion que indica si un numero es el triangular del otro

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


Begin
  readln(n1);
  writeln;
  readln(n2);
  writeln;
  readln(op);
  writeln;
  Case op Of
    1: bool := contenido(n1,n2);
    2: bool :=  amigo(n1,n2);
    3: bool := Inverso(n1,n2);
    4: bool := triangular(n1,n2);
  End;
  If bool Then
    Begin
      writeln('si')
    End
  Else
    Begin
      writeln('no')
    End;

  readln;
End.
