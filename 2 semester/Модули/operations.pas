unit operations;


interface

type
  Vector_ = array of integer;
  Matrica = array [,] of integer;

var
  m: matrica; 
  v: vector_;

procedure vector_square(n: integer; v: array of integer);
procedure double_matrix(mnoz, n: integer; m: matrica);

implementation


procedure vector_square(n: integer; v: array of integer);
var
  otvet: integer;
begin
  writeln;
  write('Результат возведения начального вектора в квадрат по математическим правилам: ');
  for var i := 0 to n - 1 do
  begin
    otvet += v[i] * v[i];
  end;
  writeln(otvet);
  writeln;
end;

procedure double_matrix(mnoz, n: integer; m: matrica);
begin
  writeln;
  writeln('Результат умножения начальной матрицы на ', mnoz, ':');
  for var i := 0 to n - 1 do
  begin
    for var j := 0 to n - 1 do
    begin
      write(m[i, j] * mnoz:10);
    end;
    writeln;
  end;
end;
end.