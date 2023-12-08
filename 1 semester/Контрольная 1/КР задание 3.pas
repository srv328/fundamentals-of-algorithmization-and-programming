var x,eps,otvet:real;
    n:integer;
    
function f(r:integer):integer;
var t:integer;
begin
  t:=1;
  for var i:=1 to r do  begin
    t:=t*i;
    end;
    f:=t;
end;


begin
  writeln('Введите eps: ');
  readln(eps);
  writeln('Введите x: ');
  readln(x);
  n:=0;
  if ((exp(n*ln(-1))*(exp(2*n*ln(x)))))/(2*f(n))>((exp((n+1)*ln(-1))*(exp(2*(n+1)*ln(x)))))/(2*f(n+1)) then begin
    while ((exp((n+1)*ln(-1))*(exp(2*(n+1)*ln(x)))))/(2*f(n+1))-((exp(n*ln(-1))*(exp(2*n*ln(x)))))/(2*f(n))>eps do begin
      otvet:=otvet+((exp(n*ln(-1))*(exp(2*n*ln(x)))))/(2*f(n));
      n:=n+1;
    end;
    
  end
  else
    begin
    writeln('Сумма бесконечна.');
  end;
  writeln(otvet);
    
end.
    