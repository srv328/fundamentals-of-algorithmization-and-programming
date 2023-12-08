var otvet:real;
    n:integer;
    
begin
  writeln('Введите n: ');
  read(n);
  otvet:=0;
  for var i:=1 to n do begin
    otvet:=sqrt(otvet+(3*i));
  end;
  writeln(otvet);
end.