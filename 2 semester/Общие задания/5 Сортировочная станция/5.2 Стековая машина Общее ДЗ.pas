type
  P_elem = ^elem;
  elem = record
    data: real;
    next: p_elem;
  end;

var
  head: P_elem;

procedure List(symbol: real; var p1: P_elem);
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
  end;
end;

function calc(a, b: real; operation: string): real;
begin
  if operation = '-' then calc := a - b;
  if operation = '+' then calc := a + b;
  if operation = '*' then calc := a * b;
  if operation = '/' then calc := a / b;
end;

procedure start();
var
  f: text;
  symbol, curr_num: string;
  a, b: real;


begin
  assign(f, 'postfix.txt');
  reset(f);
  read(f, symbol);
  for var i := 1 to Length(symbol) do
  begin
    if symbol[i] in '0123456789' then begin
      curr_num += symbol[i];
    end
    else begin
      if curr_num <> '' then begin
        List(curr_num.ToInteger, head);
        curr_num := '';
      end;
      if symbol[i] in '+-*/' then begin
      if head^.next <> nil then begin
        a := head^.data;
        kill_head(head);
        b := head^.data;
        kill_head(head);
        List(calc(b, a, symbol[i]), head);
      end;
      end;
    end;
  end;
  close(f);
  assign(f,'otvet.txt');
  rewrite(f);
  writeln('Ответ: ',head^.data);
  write(f,head^.data);
  kill_head(head);
  close(f);
  writeln('Программа завершена.');
end;

begin
  start();
end.