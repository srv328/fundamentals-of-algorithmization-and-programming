var m,n,m1,n1,nm:integer;
    otvet:real;

begin
  write('n = ');
  read(n);
  write('m = ');
  read(m);
  if (m<0) or (n<=m) or (m>19) or (n>20) then begin
  write('Введены неверные значения: 0<=m<n<=20');
  end
  else
  begin
  n1:=1;
  m1:=1;
  nm:=1;
  for var i:=1 to n do begin
    n1:=n1*i;
  end;
  for var i:=1 to m do begin
    m1:=m1*i;
  end;
  for var i:=1 to (n-m) do begin
    nm:=nm*i;
  end;
  otvet:=n1/(m1*nm);
  write(otvet);
  end;
end.