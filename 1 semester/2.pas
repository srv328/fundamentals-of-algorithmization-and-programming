const
  n = 10;
  m = 8;
 
type
  matrix = array[1..n, 1..m] of integer;
 
function MinNonZero(a: matrix): integer;
var
  i, j: integer;
  imin, min, k: integer;
 
begin
  min := maxint;  
  imin := 1;
  for i := 1 to n do
  begin
    k := 0;  
    for j := 1 to m do
      if (a[i, j] <> 0) and (j mod 2 = 0) then
        inc(k);
    if k < min then
    begin
      min := k;
      imin := i;
    end;  
  end;
  MinNonZero := imin; 
end;
 
var
  i, j: integer;
  a: matrix;
 
begin
  randomize;
  for i := 1 to n do
  begin
    for j := 1 to m do
    begin
      a[i, j] := random(n * m);
      write(a[i, j]:4);
    end;
    writeln;
  end;
  writeln(minNonZero(a));  
end.