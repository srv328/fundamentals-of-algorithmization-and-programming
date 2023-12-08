type
  P_elem = ^elem;
  elem = record
    data: string;
    next: p_elem;
  end;

var
  head: P_elem;
  flag: byte;
  surname: string;

procedure vstavka(symbol: string; var p1: P_elem);
var
  p, p_new: P_elem;
begin
  if (p1 = nil) then begin
    new(p1);
    p1^.data := symbol;
    p1^.next := nil;
  end
  else begin
    p := p1;
    new(p_new);
    while (p^.next<>nil) do begin
        p:=p^.next;
    end;
    p_new^.next := nil;
    p_new^.data := symbol;
    p^.next := p_new;
  end;
end;

procedure kill_head(var p1: P_elem);
var
  p: P_elem;
begin
  if p1 <> nil then begin
    p := p1;
    p1 := p1^.next;
    writeln('Покупатель ', p^.data, ' обслужен.');
    Dispose(p);
  end
  else begin
    writeln;
    writeln('Нет человек в очереди. ');
  end;
end;

procedure print_list(p1:P_elem);
var p:P_elem;
begin
  if p1<>nil then begin
    write('Текущая очередь: ');
    write(p1^.data,' ');
  p:=p1;
  while (p^.next<>nil) do begin
  p:=p^.next;
  write(p^.data,' ');
  end;
  writeln;
  end
  else writeln('Все покупатели были обслужены. ');
end;


procedure Print_Menu();
begin
  writeln('Выберите действие, которое хотите реализовать:');
  writeln('0 - Выход из программы');
  writeln('1 - Добавить человека в очередь');
  writeln('2 - Обслужить человека');
end;


begin
  repeat
    Print_Menu();
    readln(flag);
    case flag of
      1:
        begin
          write('Введите фамилию покупателя: ');
          readln(surname);
          vstavka(surname, head);;
          print_list(head);
        end;
      2:
        begin
          kill_head(head);
          print_list(head);
        end;
    end;
  until flag = 0;
  writeln('Программа завершена.');
end.