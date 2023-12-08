var x,eps,t,s:real;
    n:integer;
begin
write('x = ');
readln(x);
write('eps = ');
readln(eps);
n:=1;
t:=x;
s:=t;
while abs(t)/n >eps do
 begin
  n:=n+1;
  t:=-t*x;
  s:=s+t/n;
 end;
writeln('Ответ по алгоритму: = ',s);
write('Проверка: ',ln(x+1))
end.