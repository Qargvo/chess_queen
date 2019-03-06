program Queen;

{$APPTYPE CONSOLE}

uses
  Windows;

type
  techer = array of array of byte;
var
  ch: techer;
  log: array of ShortInt;
  i, j: shortint;
  n, m, t: Byte;
  cnt: cardinal;
  mc,mr,md,mu:array of Byte;
  fr,t1,t2: Int64;
procedure incarr(x, y: byte);
var
  i, j: ShortInt;
begin
Inc(mc[y]);
Inc(mr[x]);
Inc(mu[m+(y-x)]);
Inc(md[x+y]);
end;

procedure decarr(x, y: byte);
var
  i, j: ShortInt;
begin
dec(mc[y]);
dec(mr[x]);
dec(mu[m+(y-x)]);
dec(md[x+y]);
end;

procedure Write_Mas(const mas: techer);
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
  writeln;
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

    SetLength(log, m);
    SetLength(mc,m);
    SetLength(mr,n);
    SetLength(md,m+n-1);
    SetLength(mu,m+n-1);
    //initialization
    for i := 0 to m - 1 do
      mc[i]:=0;
    for i := 0 to n - 1 do
      mr[i] := 0;
    for i :=0 to n + m - 2 do
      begin
        mu[i]:=0;
        md[i]:=0;
      end;
    for i := 0 to m - 1 do
      log[i] := -1;
    i := 0;
    j := 0;
    QueryPerformanceFrequency(fr);
    QueryPerformancecounter(t1);
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
        decarr(log[j], j);
        Continue;
      end;
      if mr[i]+mc[j]+mu[m+(j-i)]+md[i+j] <> 0 then
      begin
        log[j] := i;
        Continue;
      end;
      incarr(i, j);
      log[j] := i;
      Inc(j);
      if j = m then
      begin
        Inc(cnt);
        dec(j);
        decarr(log[j], j);
        Continue;
      end;

    end;
    QueryPerformancecounter(t2);
    writeln(' Time2 = ',(t2-t1)*1000/fr:0:4,' ms');
    Writeln(cnt);
  end;
  Readln;
end.

