const
  N = 100;

type
  MyArray = array[1..N] of integer;

var
  A: MyArray;

function Massiv(PutAtArray: MyArray): MyArray;
begin
  randomize;
  for var i := 1 to N do
  begin
    PutAtArray[i] := random(100);
    Massiv := PutAtArray;
  end;
  writeln('Начальный массив A: ', PutAtArray);
end;

procedure Bubble(Bubble_Array: MyArray);
var
  k, count,count_M: integer;
begin
  for var i := 1 to N - 1 do begin
    count_M+=1;
    for var j := 1 to N - i do
      if Bubble_Array[j] > Bubble_Array[j + 1] then begin
        k := Bubble_Array[j];
        Bubble_Array[j] := Bubble_Array[j + 1];
        Bubble_Array[j + 1] := k;
        count += 1;
      end;
      end;
  writeln;
  writeln('Bubble Sort');
  write('C(n) = ', count);
  writeln;
  write('M(n) = ', count_M);
  writeln;
  writeln(Bubble_Array);
end;

procedure Shaker(Shaker_Array: MyArray);
var
  count,count_M, i, tmp, e, s, k: integer;

begin
  k := N;
  s := 1; 
  e := N; 
  while e > s do
  begin
    count_M+=1;
    for i := e downto s + 1 do
      if Shaker_Array[i] < Shaker_Array[i - 1] then
      begin
        tmp := Shaker_Array[i];
        Shaker_Array[i] := Shaker_Array[i - 1];
        Shaker_Array[i - 1] := tmp;
        k := i;
        count += 1;
      end;
    s := k;
    for i := s to e - 1 do
      if Shaker_Array[i] > Shaker_Array[i + 1] then
      begin
        tmp := Shaker_Array[i];
        Shaker_Array[i] := Shaker_Array[i + 1];
        Shaker_Array[i + 1] := tmp;
        k := i;
        count += 1;
      end;
    e := k;
  end;
  writeln;
  writeln('Shaker Sort');
  write('C(n) = ', count);
  writeln;
  write('M(n) = ', count_M);
  writeln;
  writeln(Shaker_Array);
end;

procedure Vibor(Vibor_Array: MyArray);
var
  count,count_M, max, id_max, j: integer;

begin
  j := N;
  
  while j > 1 do
  begin
    count_M+=1;
    max := Vibor_Array[1];
    id_max := 1;
    for var i := 2 to j do
      if Vibor_Array[i] > max then begin
        max := Vibor_Array[i];
        id_max := i;
        count += 1;
      end;
    Vibor_Array[id_max] := Vibor_Array[j];
    Vibor_Array[j] := max;
    j := j - 1;
    count += 1;
  end;
  writeln;
  writeln('Vibor Sort');
  write('C(n) = ', count);
  writeln;
  write('M(n) = ', count_M);
  writeln;
  writeln(Vibor_Array);
end;

procedure Vstavka(Vstavka_Array: MyArray);
var
  count,count_M, j, t: integer;

begin
  for var i := 1 to N do
  begin
    count_M+=1;
    t := Vstavka_Array[i];
    j := i - 1;
    while (j >= 1) and (Vstavka_Array[j] > t) do 
    begin
      Vstavka_Array[j + 1] := Vstavka_Array[j];
      j := j - 1;
      count += 1;
    end;
    Vstavka_Array[j + 1] := t;
    count += 1;
  end;
  writeln;
  writeln('Vstavka Sort');
  write('C(n) = ', count);
  writeln;
  write('M(n) = ', count_M);
  writeln;
  writeln(Vstavka_Array);
end;

procedure Bin_Vstavka(Bin_Vstavka_Array: MyArray);
var
  count,count_M, l, r, m, x: integer;

begin
  for var i := 2 to N do
  begin
    count_M+=1;
    x := Bin_Vstavka_Array[i];
    l := 1;
    r := i - 1;
    while l <= r do 
    begin
      m := (l + r) div 2;
      if x < Bin_Vstavka_Array[m] then begin
        r := m - 1;
        count += 1;
      end
      else
        begin
        l := m + 1; 
        count += 1;
      end;
    end;
    for var j := i - 1 downto l do Bin_Vstavka_Array[j + 1] := Bin_Vstavka_Array[j];
    Bin_Vstavka_Array[l] := x; count += 1;
  end;
  writeln;
  writeln('Bin Vstavka Sort');
  write('C(n) = ', count);
  writeln;
  write('M(n) = ', count_M);
  writeln;
  writeln(Bin_Vstavka_Array);
end;

begin
  A := Massiv(A);
  
  Bubble(A);
  
  Shaker(A);
  
  Vibor(A);
  
  Vstavka(A);
  
  Bin_Vstavka(A);
  
end.