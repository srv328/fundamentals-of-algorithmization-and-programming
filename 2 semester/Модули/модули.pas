uses creation, operations;

var
  mnoz, n: integer;

begin
  write('Введите размерность: ');
  readln(n);
  Matrix(n);
  Vector(n);
  var vector_res := creation.v;
  var matrica_res := creation.m;
  operations.vector_square(n, vector_res);
  write('На какое число умножаем матрицу: ');
  readln(mnoz);
  operations.double_matrix(mnoz, n, matrica_res);
end.