program Queen;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  techer = array of array of byte;
var
  ch: techer;
  log: array of Byte;
  i, j: Byte;
  n, m: Byte;
  cnt:Byte;
begin
  {Write('Enter the number of measurements: ');
  Readln;
  writeln('Let there be 2 measurements');}

  Write('Enter size of desck(n,m): ');
  Readln(n, m);
  if m > n then
  begin
    m := n + m;
    n := m - n;
    m := m - n;
  end;
  SetLength(ch, n, m);
  SetLength(log, m);
  for i:=0 to m-1 do
    log[i]:=0;
  for i:=0 to n-1 do
    for j:=0 to m-1 do
      ch[i,j]:= 0;
  Readln;
end.
 
