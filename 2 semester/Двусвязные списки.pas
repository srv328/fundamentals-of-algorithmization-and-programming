type
  p_Elem = ^Elem;
  Elem = record
    prev: p_Elem;
    data: integer;
    next: p_Elem;
  end;

var
  p_begin, p_end: p_Elem;
  curSize, key, n, k: integer;

procedure createList(n: integer; var head: p_Elem; var tail: p_Elem; var curSize: integer);
var
  i: integer;
  elem: p_Elem;
begin
  curSize := 0;
  Randomize;
  i := 1;
  new(head);
  inc(curSize);
  head^.data := random(101);
  head^.next := nil;
  head^.prev := nil;
  elem := head;
  repeat
    new(elem^.next);
    inc(curSize);
    elem^.next^.next := nil;
    elem^.next^.prev := elem;
    elem := elem^.next;
    elem^.data := random(101);
    inc(i);
  until i >= n;
  tail := elem;
end;

procedure printList(head: p_Elem);
begin
  var elem: p_Elem;
  if head <> nil then begin
    write(head^.prev, '←');
    write('(', head^.data, ')', head, '⟷');
    elem := head;
    while elem^.next <> nil do
    begin
      elem := elem^.next;
      if elem^.next <> nil then begin
        write('(', elem^.data, ')', elem, '⟷');
      end
      else begin
        write('(', elem^.data, ')', elem, '→');
      end;
    end;
    writeln(elem^.next);
  end
  else writeln('Список пуст.');
end;

procedure addElement(index: integer; var curSize: integer; var head: p_Elem; var tail: p_Elem);
var
  i: integer;
  elem, newElement, save: p_Elem;
begin
  Randomize;
  if head = nil then begin
    new(head);
    head^.data := random(101);
    head^.next := nil;
    head^.prev := nil;
  end
  else begin
    elem := head;
    if index <= 1 then begin
      writeln('Так как i<=1, добавляю элемент на первое место списка.');
      new(newElement);
      newElement^.data := random(101);
      elem^.prev := newElement;
      newElement^.prev := nil;
      newElement^.next := elem;
      head := newElement;
    end else if index >= curSize then begin
      writeln('Так как i больше длины списка, добавляю элемент в конец списка.');
      new(newElement);
      newElement^.data := random(101);
      elem := tail;
      elem^.next := newElement;
      newElement^.next := nil;
      newElement^.prev := elem;
      tail := newElement;
    end
    else begin
      if curSize - index > index then begin
        i := 1;
        while (i < index) and (elem^.next <> nil) do
        begin
          save := elem;
          elem := elem^.next;
          inc(i);
        end;
        if i = index then begin
          new(newElement);
          newElement^.data := random(101);
          save^.next := newElement;
          newElement^.next := elem;
          newElement^.prev := save;
          elem^.prev := newElement;
        end;
      end
      else begin
        i := curSize;
        elem := tail;
        while i > index do
        begin
          save := elem;
          elem := elem^.prev;
          Dec(i);
        end;
        if i = index then begin
          new(newElement);
          newElement^.data := random(101);
          save^.prev^.prev^.next := newElement;
          newElement^.next := elem;
          newElement^.prev := elem^.prev;
          elem^.prev := newElement;
        end;
      end;
    end;
  end;
  inc(curSize);
end;

procedure deleteExactElement(index: integer; var curSize: integer; var head: p_Elem; var tail: p_Elem);
var
  i: integer;
  elem, save: p_Elem;
begin
  if head <> nil then begin
    if head^.next = nil then dispose(head); 
  end;
  if head <> nil then begin
    elem := head;
    if index <= 1 then begin
      index := 1;
      writeln('Так как i не больше единицы, удаляю первый элемент списка');
    end;
    if index = 1 then begin
      head := elem^.next;
      if elem <> nil then head^.prev := elem^.prev;
      dispose(elem);
    end
    else
    if index >= curSize then begin
      writeln('Так как i больше длины списка, удаляю последний элемент');
      elem := tail;
      save := elem^.prev;
      dispose(elem);
      tail := save;
      tail^.next := nil;
    end
    else if curSize - index > index then begin
      i := 1;
      while (i < index) and (elem^.next <> nil) do
      begin
        save := elem;
        elem := elem^.next;
        inc(i);
      end;
      if i = index then begin
        save^.next := elem^.next;
        save^.next^.prev := save;
        dispose(elem);
      end;
    end
    else begin
      i := curSize;
      elem := tail;
      while i > index do
      begin
        save := elem;
        elem := elem^.prev;
        Dec(i);
      end;
      if i = index then begin
        save^.prev := elem^.prev;
        save^.prev^.next := save;
        dispose(elem);
      end;
    end;
    dec(curSize);
  end
  else writeln('Список пуст');
end;

procedure printPosl(var head: p_elem);
var
  elem: p_Elem;

begin
  if head <> nil then begin
    writeln('Последовательность элементов, полученных в куче.');
    writeln;
    write(head^.data,' ');
    elem := head;
    while elem^.next <> nil do
    begin
      elem := elem^.next;
      if elem^.next <> nil then begin
        write(elem^.data,' ');
      end
      else begin
        writeln(elem^.data,' ');
      end;
    end;
    writeln;
  end
  else writeln('Список пуст.');
end;

procedure deleteList(var head: p_Elem; var tail: p_Elem; var curSize: integer);
var
  elem: p_Elem;
begin
  if head <> nil then begin
    elem := head;
    while elem^.next <> nil do
    begin
      printList(p_begin);
      elem := elem^.next;
      elem^.prev := nil;
      dispose(head);
      head := elem;
    end;
    dispose(head);
  end
  else begin
    writeln('Список уже пуст');
  end;
end;


procedure print_menu();
begin
  writeln('0 - Выход', #10, '1 - Создать список', #10, '2 - Добавить элемент в список', #10, '3 - Распечатать список', #10, '4 - Удалить элемент', #10, '5 - Удалить список', #10, '6 - Удалить все элементы с нечётными номерами в поле с данными', #10, '7 - Вывести последовательность элементов, полученных в куче');
end;


procedure deletenechet(var head: p_Elem; var curSize: integer; var tail: p_Elem);
var
  elem: p_Elem;
var
  index: integer;
begin
  index := curSize;
  elem := tail;
  if head <> nil then begin
    while elem <> nil do
    begin
      if elem^.data mod 2 <> 0 then deleteExactElement(index, curSize, head, tail);
      elem := elem^.prev;
      dec(index);
    end;  
  end
  else
    writeln('Список пуст');
end;



begin
  repeat
    print_menu();
    read(key);
    case key of
      1:
        begin
          repeat
            writeln('Введите количество элементов в списке, не меньше двух!');
            read(n);
          until n > 1;
          createList(n, p_begin, p_end, curSize);
          writeln('Список успешно на ', n, ' элементов успешно создан');
          printList(p_begin);
        end;
      2:
        begin
          if n = 0 then begin
            writeln('Создайте список, чтобы получить доступ к другим командам');
          end
          else begin
            writeln('Введите индекс элемента, который хотите добавить');
            read(k);
            addElement(k, curSize, p_begin, p_end);
            printList(p_begin);
          end;
        end;
      3:
        begin
          if n = 0 then begin
            writeln('Список пуст');
          end
          else begin
            printList(p_begin);
          end;
        end;
      4:
        begin
          if n = 0 then begin
            writeln('Создайте список, чтобы получить доступ к другим командам');
          end
          else begin
            writeln('Введите индекс элемента который хотите удалить');
            read(k);
            deleteExactElement(k, curSize, p_begin, p_end);
            printList(p_begin);
          end;
        end;
      5:
        begin
          if n = 0 then begin
            writeln('Список уже пуст');
          end
          else begin
            deleteList(p_begin, p_end, curSize);
            printList(p_begin);
            writeln('Список успешно удалён.')
          end;
        end;
      6:
        begin
          if n = 0 then begin
            writeln('Список пуст');
          end
          else begin
            deletenechet(p_begin, curSize, p_end);
            writeln('Нечётные элементы успешно удалёны.');
            printList(p_begin);
          end;
        end;
      7:
        begin
          if n = 0 then begin
            writeln('Список пуст');
          end
          else begin
            printPosl(p_begin);
          end;
        end;
    end;
  until key = 0;
end.