program primitivas;

Uses CRT;

var
    Entrada:text; Salida:text;
    Procedure LlenarArchivo(var Entrada:text);
    Var
        salir:char; c:char; c2:Char; s:string;
    Begin
    Reset(Entrada);
    rewrite(Salida);
    While not(eof(Entrada)) do
    begin
    read(entrada,c);
    C:= lowercase(c);
    case c of
    'a': Begin
            write(Salida,'a');
            while not(eoln(entrada)) do
            begin
            read(Entrada,c2);
            write(salida,c2);
            end;
            readln(Entrada,c);
            writeln(salida);
        End;
    'e': Begin
            write(Salida,'e');
            while not(eoln(entrada)) do
            begin
            read(Entrada,c2);
            write(salida,c2);
            end;
            readln(Entrada,c);
            writeln(salida);
        End;
    'i': Begin
            write(Salida,'i');
            while not(eoln(entrada)) do
            begin
            read(Entrada,c2);
            write(salida,c2);
            end;
            readln(Entrada,c);
            writeln(salida);
        End;
    'o': Begin
            write(Salida,'o');
            while not(eoln(entrada)) do
            begin
            read(Entrada,c2);
            write(salida,c2);
            end;
            readln(Entrada,c);
            writeln(salida);
        End;
    'u': Begin
            write(Salida,'u');
            while not(eoln(entrada)) do
            begin
            read(Entrada,c2);
            write(salida,c2);
            end;
            readln(Entrada,c);
            writeln(salida);
        End;
    Else
        Readln(Entrada,C);
    end;
    end;

    Close(Entrada);
    Close(Salida);
    End;


    begin
    clrscr;
    assign(Entrada,'c:\datos\Entrada.txt');
    assign(Salida,'c:\datos\Salida.txt');
    reset(Entrada);
    writeln('Inicio');//punto de control
    readln;
    LlenarArchivo(Entrada);
    writeln('fin');//punto de control
    readln;
    Close(Entrada);

    end.
