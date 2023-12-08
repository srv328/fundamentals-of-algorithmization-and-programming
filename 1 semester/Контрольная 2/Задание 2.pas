var x,t,eps,summa:real;
    n:integer;

begin
  write('eps = ');
  read(eps);
  write('x = ');
  read(x);
  n:=1;
  summa:=x*x*x;
  while abs(t)>eps do begin
    n+=1;
    t:=t*(-(x*x*x)/n);
    summa+=t;
  end;
  write(summa);
end.  