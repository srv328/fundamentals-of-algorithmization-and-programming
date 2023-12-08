Program nomer_3;
Var Resultat,value1,value2,eps,x,shag,n:real;
Begin
  writeln('x=');readln(x);
  n:=1;
  shag:=0;
  value1:= 0;
  value2:= 0;
  eps:= 1e-15;
  Resultat:= 0;
  repeat begin
    value1:= Resultat;
    Resultat:= ((sqrt(abs(x))))/( (power(n+shag,3)) );
    value2:= Resultat;
    shag:= shag+1;   
  end;
  until((value2-value1)<eps);
  writeln(Resultat);
end.