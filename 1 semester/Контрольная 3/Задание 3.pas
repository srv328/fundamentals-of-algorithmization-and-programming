Const N = 2;
type
  MyArray = array[1..N] of integer;
  f = function(el:integer):integer;
 
var
  A: MyArray;
  otvet:integer;
  
function Massiv(PutAtArray: MyArray;q:f): MyArray;
var otvet:real;
begin
  randomize;
  otvet:=1;
  for var i := 1 to N do
  begin
    PutAtArray[i] := random(100);
    Massiv := PutAtArray;
    otvet:=1;
    for var j:=1 to N do begin
    otvet:=otvet*q(PutAtArray[j]);
    end;
    end;
  writeln('Начальный массив A: ', PutAtArray);
  writeln('Произведение элементов к которым применена функция: ',otvet);
end;

function q(el:integer):integer;
begin
  el:=el*el;
  q:=el;
end;

begin
  Massiv(A,q);
end.