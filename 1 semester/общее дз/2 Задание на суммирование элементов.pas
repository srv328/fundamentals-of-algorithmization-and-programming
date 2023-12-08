const N=7;
var a:array[1..N,1..N] of integer;
    j,r,summa:integer;
begin
  randomize;
  for var i:=1 to N do begin
    for var k:=1 to N do
      a[i][k]:=random(10);
  end;
  writeln('Печать массива');
  for var i:=1 to N do
    begin
      for var k := 1 to N do
        write(a[i, k]:4);
      writeln;
  end;
  j:=1;
  summa:=0;
  //верхняя граница
  for r:=1 to N do
    summa:=summa+a[j][r];
  j:=N;
  //нижняя граница
  for r:=1 to N do
    summa:=summa+a[j][r];
  //левый бок
  r:=1;
  for j:=2 to (N-1) do
    summa:=summa+a[j][r];
  //правый бок
  r:=N;
  for j:=2 to (N-1) do
    summa:=summa+a[j][r];
  writeln('Сумма элементов по внешнему краю равна: ',summa);
  summa:=0;
  for var i:=1 to N do begin
    for var k:=1 to N do begin
      if i=k then
        summa:=summa+a[i][k];
      if i+k=N+1 then
        summa:=summa+a[i][k];
    end;
    end;
    writeln('Сумма диагоналей: ',summa-a[N div 2 + 1][N div 2 + 1]);
    summa:=0;
    for var i:=1 to N do begin
    for var k:=1 to N do begin
      if i=k then
        summa:=summa+a[i][k];
      if i+k=N+1 then
        summa:=summa+a[i][k];
    end;
    end;
    summa:=0;
    //pesok time
    for var i:=1 to N do begin
      for var q:=1 to N do begin
        if ((i+q<=N+1) and (i<=q)) or ((i+q>=N+1)and(i>=q)) then
          summa+=a[i][q];
      end;
    end;
    writeln('Сумма песочных часов: ',summa);
    summa:=0;
    //romb
    for var i:=1 to N do begin
      for var q:=1 to N do begin
        if (i+q>=N+1-(n div 2)) and (i+q<=N+1+(n div 2)) and (i>=q-(n div 2)) and (i<=q + (N div 2)) then
          summa+=a[i][q];
      end;
    end;
    writeln('Сумма ромба: ',summa);
end.