var x,y:real;
begin
  writeln('Введите X: ');
  read(x);
  writeln('Введите Y: ');
  read(y);
  if (y<=0) and (y>=-2) and (x>=-1) and (x<=1) then begin
  writeln('Принадлежит');
  exit();
  end;
  if (x>=-1) and (x<=0) and (x<=-y) then begin
  writeln('Принадлежит');
  exit();
  end;
  if (x>=0) and (x<=1) and (x<=y) then begin
  writeln('Принадлежит');
  exit();
  end;
  writeln('Не принадлежит');
end.