Type
  P_elem = ^elem;
  elem = record
    data:char;
    next:p_elem;
  end;
  
var
  P_begin: P_elem;
  flag,num: integer;
  stroka:string;

procedure vstavka(symbol:char;num:integer; var p1:P_elem);
var
  p,h,p_new:P_elem;
  i:integer;
begin
  if (p1=nil) then begin
    new(p1);
    p1^.data:=symbol;
    p1^.next:=nil;
  end
  else begin
    i:=1;
    p:=p1;
    if (num<=1) then begin
      writeln('Элемент в список вставляю на первое место');
      new(p_new);
      p_new^.data:=symbol;
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
        p_new^.data:=symbol;
        h^.next:=p_new;
        p_new^.next:=p;
      end
      else begin
        new(p_new);
        p_new^.next:=nil;
        p_new^.data:=symbol;
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
    write('(',p1^.data,')',p1,' ');
  p:=p1;
  while (p^.next<>nil) do begin
  p:=p^.next;
  write('(',p^.data,')',p,' ');
  end;
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

procedure start();
begin
  for var i:=1 to stroka.Length do begin
    vstavka(stroka[i],stroka.Length,P_begin);
  end;
  write('Начальный список: ');
  print_list(P_begin);
end;

procedure obr(p1:P_elem);
var p:P_elem;
begin
  writeln;
  write('Перевернутый список: ');
  if p1<>nil then begin
    p:=p1;
    for var i:=1 to stroka.Length-1 do begin
      p:=p1;
      while p^.next<>nil do begin
        p:=p^.next;
      end;
      write('(',p^.data,')',p,' ');
      kill_element(1000,P_begin);
    end;
    write('(',P_begin^.data,')');
    write(P_begin);
  end
  else writeln('Список пуст');
end;

begin
  write('Введите строку символов: ');
  readln(stroka);
  start();
  obr(P_begin);
end.