﻿//Проверку значений А,Х сделал
//Ввод числа Х с клавиатуры тоже.
//Сделал проверку возможности нахождения числа K.
var x,a:real;
    k:integer;
begin
k:=1;
writeln('Введите Х: ');
read(x);
writeln('Введите А: ');
read(a);
if (a<0.0) then begin
  writeln('Число А отрицательно и не попадает в диапазон допустимых значений. Запустите программу еще раз.');
  exit();
  end;
if (x<0.0) then begin
  writeln('Число X отрицательно и не попадает в диапазон допустимых значений. Запустите программу еще раз.');
  exit();
  end;
  
if (abs(exp(k*ln(x))/k))>(abs(exp((k+1)*ln(x))/(k+1))) then begin
  while (abs(exp(k*ln(x))/k))>=a do begin
  k:=k+1;
  end;
  writeln('Число К, при котором выполняется неравенство: ',k);
  end
  else begin
    write('Невозможно найти число K, при котором будет выполняться неравенство.Каждый последующий член последовательности больше предыдущего.');
  end;
end.