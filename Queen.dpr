program Queen;

{$APPTYPE CONSOLE}
{$WARNINGs OFF}

uses
  Windows;

type
  techer = array of array of byte;
var
  ch: techer;
  log: array of ShortInt;
  i, j: shortint;
  n, m, t: Byte;
  cnt: Cardinal;
  tm, fr,t1,t2: Int64;
{function time: int64;
asm
   rdtsc
end;  }
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
  while (j <= m) and (i >= 0) do
  begin
    inc(arr[i, j]);
    Dec(i);
    Inc(j);
  end;
  i := x;
  j := y;
  while (j <= m) and (i <= n) do
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
  while (j <= m) and (i >= 0) do
  begin
    dec(arr[i, j]);
    Dec(i);
    Inc(j);
  end;
  i := x;
  j := y;
  while (j <= m) and (i <= n) do
  begin
    dec(arr[i, j]);
    inc(i);
    Inc(j);
  end;

end;

procedure Write_Mas(const mas: techer;fn: string = '');
var
  i, j: cardinal;
begin
  for i := Length(mas) - 1 downto 0 do
  begin
    for j := 0 to Length(mas[i]) - 1 do
      if mas[i, j] = 6 then
        write('#')
      else
        write('+');
    Writeln;
  end;

end;
begin
  {Write('Enter the number of measurements: ');
  Readln;
  writeln('Let there be 2 measurements');}
  while True do
  begin
    Write('Enter size of desck(n,m): ');
    cnt := 0;
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
      log[i] := -1;
    for i := 0 to n - 1 do
      for j := 0 to m - 1 do
        ch[i, j] := 0;
    i := 0;
    j := 0;
    QueryPerformanceFrequency(fr);
    QueryPerformancecounter(t1);
    //tm := time;
    while j >= 0 do
    begin
      i := log[j];
      inc(i);
      if i = n then
      begin
        if j = 0 then
          Break;
        log[j] := -1;
        Dec(j);
        decarr(ch, log[j], j);
        Continue;
      end;
      if ch[i, j] <> 0 then
      begin
        log[j] := i;
        Continue;
      end;
      incarr(ch, i, j);
      log[j] := i;
      Inc(j);
      if j = m then
      begin
        Inc(cnt);
        dec(j);
        //Write_Mas(ch,'qwerty.txt');
        //writeln;
        decarr(ch, log[j], j);
        Continue;
      end;

    end;
    QueryPerformancecounter(t2);
    //tm := time - tm;
    writeln({' time = ', tm / fr: 0: 4, ' ms',}' Time2 = ',(t2-t1)*1000/fr:0:4,' ms');
    Writeln(cnt);
  end;
  Readln;
end.

