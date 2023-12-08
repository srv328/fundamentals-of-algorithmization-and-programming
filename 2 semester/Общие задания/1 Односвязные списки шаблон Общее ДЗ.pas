Type
  P_elem = ^elem;
  elem = record
    data:integer;
    next:p_elem;
  end;
  
var
  P_begin: P_elem;
  flag,num: integer;

procedure create_list(num:integer; var p1:P_elem);
var
  i:integer;
  p:P_elem;
begin
  new(p1);
  i:=1;
  p1^.next:=nil;
  p1^.data:=i;
  p:=p1;
  while i<num do begin
  new(p^.next);
  p^.next^.next:=nil;
  p:=p^.next;
  i:=i+1;
  p^.data:=i;
  end;
end;

procedure vstavka(num:integer; var p1:P_elem);
var
  p,h,p_new:P_elem;
  i:integer;
begin
  if (p1=nil) then begin
    new(p1);
    p1^.data:=100;
    p1^.next:=nil;
  end
  else begin
    i:=1;
    p:=p1;
    if (num<=1) then begin
      writeln('Элемент в список вставляю на первое место');
      new(p_new);
      p_new^.data:=200;
      p_new^.next:=p1;
      p1:=p_new;
    end
    else begin
      while (i<num) and (p^.next<>nil) do begin
        h:=p;
        p:=p^.next;
        i:=i+1;
      end;
      if (i=num) then begin
        new(p_new);
        p_new^.data:=300;
        h^.next:=p_new;
        p_new^.next:=p;
      end
      else begin
        writeln('Вставляю в конец списка.');
        new(p_new);
        p_new^.next:=nil;
        p_new^.data:=500;
        p^.next:=p_new;
      end;
    end;
  end;
end;

procedure kill_element(dn:integer;var p1:P_elem);
var
  h,p:P_elem;
  i:integer;
begin
  if p1<>nil then begin
    p:=p1;
    i:=1;
    if (dn<1) then begin
    writeln('Так как номер меньше единицы, удаляю первый элемент.');
    dn:=1;
    end;
    if dn=1 then begin
      p1:=p1^.next;
      Dispose(p);
    end
    else begin
      while (i<dn) and (p^.next<>nil) do begin
        h:=p;
        p:=p^.next;
        i+=1;
      end;
      if (i<>dn) and (p^.next=nil) then begin
        writeln('Число больше длины списка, удаляю последний элемент.');
        Dispose(p);
        h^.next:=nil;
      end
      else begin
        h^.next:=p^.next;
        Dispose(p);
      end;
    end;
  end
  else writeln('Список пустой');
end;

procedure print_list(p1:P_elem);
var p:P_elem;
begin
  if p1<>nil then begin
    write('(',p1^.data,')',p1,'->');
  p:=p1;
  while (p^.next<>nil) do begin
  p:=p^.next;
  write('(',p^.data,')',p,'->');
  end;
  writeln(p^.next);
  end
  else writeln('Список пуст');
end;

procedure kill_list(var p1:P_elem);
var p:P_elem;
begin
  if p1<>nil then begin
    p:=p1;
    while p^.next<>nil do begin
    p:=p^.next;
    Dispose(p1);
    p1:=p;
    print_list(p1);
    end;
    Dispose(p1);
  end
  else writeln('Список уже пуст.')
end;

procedure Print_Menu();
begin
  writeln('Выберите действие, которое хотите реализовать:');
  writeln('0 - Выход из программы');
  writeln('1 - создание списка');
  writeln('2 - удаление списка');
  writeln('3 - удаление элемента');
  writeln('4 - вставка элемента');
end;


begin
  repeat
  Print_Menu();
  readln(flag);
  case flag of
    1: begin
      writeln('Введите количество элементов списка');
      readln(num);
      create_list(num,P_begin);
      print_list(P_begin);
    end;
    2: begin
      kill_list(P_begin);
      print_list(P_begin);
    end;
    3: begin
      writeln('Введите номер элемента, который нужно удалить');
      readln(num);
      kill_element(num,P_begin);
      print_list(P_begin);
    end;
    4: begin
      writeln('Укажите номер, куда нужно вставить элемент');
      readln(num);
      vstavka(num,P_begin);
      print_list(P_begin);
    end;
  end;
  until flag = 0;
  writeln('Программа завершена.');
end.