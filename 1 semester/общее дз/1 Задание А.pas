var eps, x, p, s ,i: real;

begin
    write('x = ');
    readln(x);
    write('eps = ');
    readln(eps);
    s := 1;
    p := 1;
    i:=1;
    while (p*x/i)>eps do 
    begin
        p := p * x / i;
        s := s + p;
        i+=1;
    end;
    writeln('e^x = ',s);
    writeln('proverka: ', exp(x));
end.
