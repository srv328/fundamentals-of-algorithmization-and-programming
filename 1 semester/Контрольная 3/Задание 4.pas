﻿var
  n: integer;

function fib(n: integer): integer;
begin
  if (n = 1) or (n = 2) then
    fib := 1
  else
    fib := fib(n - 1) + fib(n - 2);
end;

begin
  writeln('Answer: ');
  readln(n);
  write(fib(n));
end.