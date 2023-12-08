//Математический модуль reshenie.

//Создан для решение линейных, квадратных, биквадратных уравнений
//Имеет в себе три функции line, square, bisquare

//function line(a,b: integer):real;
//принимает два целочисленных параметра a,b. возвращает единственное число вещественного типа, которое является решением линейного уравнения вида ax+b=0.

//function square(a,b,c: integer):array of real;
//принимает три целочисленных параметра a,b,c. возвращает массив длины 2, в которых содержатся вещественные корни, которые являются решением квадратного уравнения вида ax^2+bx+c=0.

//function bisquare(a,b,c:integer):array of real;
//принимает три целочисленных параметра a,b,c. возвращает массив длины 4, в которых содержатся вещественные корни, которые являются решением биквадратного уравнения вида ax^4+bx^2+c=0.

unit reshenie;

interface
///Функция, решающая линейное уравнение. Принимает два параметра a и b. Возвращает real.   
function line(a,b: integer):real;
///Функция, решающая квадратное уравнение. Принимает три параметра a b c. Возвращает массив real длиной 2.   
function square(a,b,c: integer):array of real;
///Функция, решающая биквадратное уравнение. Принимает три параметра a b c. Возвращает массив real длиной 4.   
function bisquare(a,b,c:integer):array of real;

implementation

function line(a,b: integer):real;
begin
  if a<>0 then begin
    writeln('Ответ на линейное уравнение: ',-b/a);
    line:=-b/a;
  end
  else begin
    writeln('Параметр a не может равняться нулю!');
  end;
end;

function square(a,b,c: integer):array of real;
var 
  massiv:array of real;
begin
  SetLength(massiv,2);
  if a<>0 then begin
    if (b*b-4*a*c)>=0 then begin
      writeln('Ответ на квадратное уравнение,первый корень: ',(-b+sqrt(b*b-4*a*c))/(2*a));
      writeln('Ответ на квадратное уравнение,второй корень: ',(-b-sqrt(b*b-4*a*c))/(2*a));
      massiv[0]:=-b+sqrt(b*b-4*a*c)/(2*a);
      massiv[1]:=-b-sqrt(b*b-4*a*c)/(2*a);
      square:=massiv;
    end
    else begin
      writeln('Дискриминант отрицательный, нет решений уравнения!');
    end;
  end
  else begin
    writeln('Параметр a не может равняться нулю!');
  end;
  SetLength(massiv,0);
end;

function bisquare(a,b,c: integer):array of real;
var 
  massiv:array of real;
begin
  SetLength(massiv,4);
  if a<>0 then begin
    if (b*b-4*a*c)>=0 then begin
      writeln('Ответ на биквадратное уравнение,первый корень: ',sqrt((-b+sqrt(b*b-4*a*c))/(2*a)));
      writeln('Ответ на биквадратное уравнение,второй корень: ',-sqrt((-b+sqrt(b*b-4*a*c))/(2*a)));
      writeln('Ответ на биквадратное уравнение,третий корень: ',sqrt((-b-sqrt(b*b-4*a*c))/(2*a)));
      writeln('Ответ на биквадратное уравнение,четвёртый корень: ',-sqrt((-b-sqrt(b*b-4*a*c))/(2*a)));
      massiv[0]:=sqrt(-b+sqrt(b*b-4*a*c)/(2*a));
      massiv[1]:=-sqrt(-b+sqrt(b*b-4*a*c)/(2*a));
      massiv[2]:=sqrt(-b-sqrt(b*b-4*a*c)/(2*a));
      massiv[3]:=-sqrt(-b-sqrt(b*b-4*a*c)/(2*a));
      bisquare:=massiv;
    end
    else begin
      writeln('Дискриминант отрицательный, нет решений уравнения!');
    end;
  end
  else begin
    writeln('Параметр a не может равняться нулю!');
  end;
  SetLength(massiv,0);
end;
end.
