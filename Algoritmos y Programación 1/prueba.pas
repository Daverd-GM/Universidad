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
program que;

uses crt;
var a:string; b:boolean;
BEGIN
clrscr;
a:='';
writeln('a ver la vaina');
delay(3000);
a:=readkey;
writeln('hello');
if readkey=a then write('p');
readln;
END.

