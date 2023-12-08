
type
  MyArray = array[1..11, 1..10] of integer;

var
  a: MyArray;

function Massiv(PutAtArray: MyArray): MyArray;
begin
  randomize;
  for var i := 1 to 11 do
  begin
    for var k := 1 to 10 do
    begin
      PutAtArray[i, k] := random(10);
      Massiv := PutAtArray;
    end;
  end;
end;

procedure Write_Array(Write_Array: MyArray);
begin
  write('Печать массива : ');
  writeln;
  writeln;
  writeln;
  for var i := 1 to 11 do
  begin
    for var k := 1 to 10 do
      write(Write_Array[i, k]:10);
    writeln;
  end;
end;

procedure Geom();
var
  geom_proiz: real;
begin
  writeln;
  writeln('Среднее геометрическое столбца: ');
  for var i := 1 to 10 do
  begin
    geom_proiz := 1;
    for var j := 1 to 11 do
    begin
      geom_proiz := geom_proiz * a[j, i];
    end;
    write(Round(sqrt(geom_proiz), 2):10);
  end;
end;

begin
  a := Massiv(a);
  Write_Array(a);
  Geom();
  
end.