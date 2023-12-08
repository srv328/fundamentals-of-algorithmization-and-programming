type
  pElem = ^Elem;
  Elem = record
    data: string;
    next: pElem;
  end;

procedure printList(head: pElem; currentSize: integer);
begin
  var elem: pElem;
  var i: integer;
  
  if head <> nil then begin
    write(head^.data, ' ');
    elem := head;
    i := 1;
    while i <> currentSize do
    begin
      elem := elem^.next;
      if i <> currentSize - 1 then 
        write(elem^.data, ' ')
      else write(elem^.data, ' ');
      inc(i);
    end;
    elem := elem^.next;
    writeln;
  end
  else writeln('Список пуст');
end;

var
  first, current, element: pElem;
  count, i, n, k: integer;
  a: array of string;

begin
  first := nil;
  current := nil;
  
  begin
    Write('Введите количество детей = ');
    readln(n);
    a := new string[n];
    for i := 0 to n - 1 do
    begin
      writeln('Введите имя ребёнка номер ', i + 1);
      readln(a[i]);
    end;
  end;
  var size: integer;
  size := n;
  Write('Количество слов в считалочке = ');
  Readln(k);
  if n < 0 then n := 1;
  if k < 0 then k := 1;
  
  for i := 1 to n do 
  begin
    if first = nil then
    begin
      new(first);
      first^.data := a[i - 1];
      first^.next := nil;
      current := first;
    end
    else
    begin
      new(element);
      element^.data := a[i - 1];
      element^.next := nil;
      current^.next := element;
      current := current^.next;
    end;
  end;
  current^.next := first;
  current := first;
  printList(first, size);
  
  while current^.next <> current do
  begin
    for i := 2 to k - 1 do
      current := current^.next;
    element := current^.next;
    current^.next := element^.next;
    current := current^.next;
    writeln('Игрок ', element^.data, ' выбыл.');
    dispose(element);
    Dec(size);
    printList(current, size);
  end;
  writeln('Игрок ', current^.data, ' победил.');
end.