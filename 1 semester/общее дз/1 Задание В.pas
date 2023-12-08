var s,x,t,e:real;
    n:integer;
begin
write('x = ');
readln(x);
write('eps = ');
read(e);
s:=x;
t:=x;
n:=1;
while abs(t)/(2*n-1)>e do
 begin
  n:=n+1;
  t:=-t*x*x;
  s:=s+t/(2*n-1)
 end;
 write(s);
 end.