//Изменил тип матриц, процедуру создания матрицы.
//Сделал правильное обращение к массиву
//Вывод матрицы на экран определил в подпрограмме
//В основной программе-только вызов функий и процедур.
//Теперь изменить изначальное количество матриц намного легче

const N=10;
type MyArray = array[1..N,1..N] of real;
var a,b,C:MyArray;
    summa1,summa2:real;
    ok:boolean;
    num_arr:integer;
    
function Massiv(PutAtArray:MyArray):MyArray;
begin
  randomize;
  for var i:=1 to N do begin
    for var k:=1 to N do begin
      PutAtArray[i,k]:=Round(random*20-10,2);
      Massiv:=PutAtArray;
    end;
  end;
end;

procedure Write_Array(Write_Array:MyArray);
begin
  if num_arr<>0 then begin
    writeln;
    writeln;
    end;
  write('Печать массива : ',num_arr+1);
  writeln;
  writeln;
  writeln;
  num_arr:=num_arr+1;
  for var i:=1 to N do begin
    for var k:=1 to N do
      write(Write_Array[i,k]:10);
      writeln;
    end;
  end;

function Sled(a1,b1:Myarray):boolean;
  var summa1,summa2:real;
  begin
    summa1:=0.0;
  for var i:=1 to N do begin
    for var k:=1 to N do begin
      if i=k then
        summa1:=summa1+a1[i][k];
      if i+k=N+1 then
        summa1:=summa1+a1[i][k];
    end;
    end;
    writeln;
    writeln;
    writeln('Сумма диагоналей 1 массива: ',summa1-a1[N div 2 + 1][N div 2 + 1]);
    summa2:=0.0;
    for var i:=1 to N do begin
    for var k:=1 to N do begin
      if i=k then
        summa2:=summa2+b1[i][k];
      if i+k=N+1 then
        summa2:=summa2+b1[i][k];
    end;
    end;
    writeln;
    writeln;
    writeln('Сумма диагоналей 2 массива: ',summa2-b1[N div 2 + 1][N div 2 + 1]);
    Sled:=summa1<summa2;
    end;

function Answer(Arr1,Arr2,LastArr:MyArray):MyArray;

begin
  ok:=Sled(a,b);
  if ok then begin
    for var i:=1 to N do begin
    for var j:=1 to N do begin
    for var s:=1 to N do begin
    C[i,j] := C[i,j] + a[i,s]*a[s,j];
    C[i,j] := Round(C[i,j],2);
    end;
    end;
    end;
  end
  else
  begin
    for var i:=1 to N do begin
    for var j:=1 to N do begin
    for var s:=1 to N do begin
    C[i,j] := C[i,j] + b[i,s]*b[s,j];
    C[i,j] := Round(C[i,j],2);
  end;
  end;
  end;
  end;
  end;
  
begin
a:=Massiv(a);
Write_Array(a);
b:=Massiv(b);
Write_Array(b);
Answer(a,b,C);
Write_Array(C);
end.