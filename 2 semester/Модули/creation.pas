unit creation;

interface

type
  Vector_ = array of integer;
  Matrica = array [,] of integer;

var
  m: matrica; 
  v: vector_;

procedure Matrix(n: integer);
procedure Vector(n: integer);
function vector_return(): Vector_;
function matrica_return(): matrica;

implementation


procedure Matrix();
begin
  m := new integer[n, n];
  randomize;
  writeln('Вывод полученной матрицы: ');
  for var i := 0 to n - 1 do
  begin
    for var j := 0 to n - 1 do
    begin
      m[i, j] := Random(100);
      write(m[i, j]:10);
    end;
    writeln;
  end;
  writeln;
end;{Matrix}

procedure Vector();
begin
  v := new integer[n];
  randomize;
  writeln('Вывод полученного вектора: ');
  for var i := 0 to n - 1 do
  begin
    v[i] := Random(100);
    write(v[i]:10);
  end;
  writeln;
end;{Vector}

function vector_return(): Vector_;
begin
  vector_return := v;
end;

function matrica_return(): matrica;
begin
  matrica_return := m;
end;
end.