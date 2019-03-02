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
  n, m, t: Byte;
  cnt: Byte;

procedure incarr(var arr: techer; x, y: byte);
var
  i, j: ShortInt;
  n, m: Byte;
begin
  n := Length(arr) - 1;
  m := Length(arr[0]) - 1;
  for i := 0 to m do
    inc(arr[x, i]);
  for i := 0 to n do
    inc(arr[i, y]);
  i := x;
  j := y;
  while (j >= 0) and (i >= 0) do
  begin
    inc(arr[i, j]);
    Dec(i);
    dec(j);
  end;
  i := x;
  j := y;
  while (j >= 0) and (i <= n) do
  begin
    inc(arr[i, j]);
    inc(i);
    Dec(j);
  end;
  i := x;
  j := y;
  while (j <= n) and (i >= 0) do
  begin
    inc(arr[i, j]);
    Dec(i);
    Inc(j);
  end;
  i := x;
  j := y;
  while (j <= n) and (i <= m) do
  begin
    inc(arr[i, j]);
    inc(i);
    Inc(j);
  end;

end;

procedure decarr(var arr: techer; x, y: byte);
var
  i, j: ShortInt;
  n, m: Byte;
begin
  n := Length(arr) - 1;
  m := Length(arr[0]) - 1;
  for i := 0 to m do
    dec(arr[x, i]);
  for i := 0 to n do
    dec(arr[i, y]);
  i := x;
  j := y;
  while (j >= 0) and (i >= 0) do
  begin
    dec(arr[i, j]);
    Dec(i);
    dec(j);
  end;
  i := x;
  j := y;
  while (j >= 0) and (i <= n) do
  begin
    dec(arr[i, j]);
    inc(i);
    Dec(j);
  end;
  i := x;
  j := y;
  while (j <= n) and (i >= 0) do
  begin
    dec(arr[i, j]);
    Dec(i);
    Inc(j);
  end;
  i := x;
  j := y;
  while (j <= n) and (i <= m) do
  begin
    dec(arr[i, j]);
    inc(i);
    Inc(j);
  end;

end;
begin
  {Write('Enter the number of measurements: ');
  Readln;
  writeln('Let there be 2 measurements');}

  Write('Enter size of desck(n,m): ');
  Readln(n, m);
  if m > n then
  begin
    t := m;
    m := n;
    n := t;
  end;
  SetLength(ch, n, m);
  SetLength(log, m);
  for i := 0 to m - 1 do
    log[i] := 0;
  for i := 0 to n - 1 do
    for j := 0 to m - 1 do
      ch[i, j] := 0;
  
  Readln;
end.

