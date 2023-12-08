type
  P_elem = ^elem;
  elem = record
    data: string;
    next: p_elem;
  end;

var
  head: P_elem;

procedure List(symbol: string; var p1: P_elem);
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
    p_new^.data := symbol;
    p_new^.next := p1;
    p1 := p_new;
  end;
end;


procedure kill_head(var p1: P_elem);
var
  p: P_elem;
begin
  if p1 <> nil then begin
    p := p1;
    p1 := p1^.next;
    Dispose(p);
  end
  else writeln('Список пустой');
end;

procedure print_list(p1: P_elem);
var
  p: P_elem;
begin
  if p1 <> nil then begin
    write('(', p1^.data, ')', p1, '->');
    p := p1;
    while (p^.next <> nil) do
    begin
      p := p^.next;
      write('(', p^.data, ')', p, '->');
    end;
    writeln(p^.next);
  end;
end;

procedure kill_list(var p1: P_elem);
var
  p: P_elem;
begin
  if p1 <> nil then begin
    p := p1;
    while p^.next <> nil do
    begin
      p := p^.next;
      Dispose(p1);
      p1 := p;
      print_list(p1);
    end;
    Dispose(p1);
  end;
end;

procedure start();
var
  stroka,slovo: string;
begin
  writeln('Введите строку со словами и пробелами: ');
  readln(stroka);
  writeln;
  slovo:='';
  for var i:=1 to stroka.Length do begin
    if stroka[i]<>' ' then begin
      slovo+=stroka[i];
    end
    else begin
      List(slovo,head);
      slovo:='';
    end;
  end; 
  List(slovo,head);
end;

procedure reverse();
begin
  writeln('Строка со словами в обратном порядке: ');
  while head <> nil do
  begin
    write(head^.data, ' ');
    kill_head(head);
  end;
  kill_list(head);
  writeln;
  writeln;
  writeln('Программа завершена.'); 
end;


begin
  start();
  reverse();
end.