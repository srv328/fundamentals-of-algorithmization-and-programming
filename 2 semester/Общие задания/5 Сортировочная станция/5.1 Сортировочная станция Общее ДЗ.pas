type
  P_elem = ^elem;
  elem = record
    data: char;
    next: p_elem;
  end;

var
  head: P_elem;
  f: text;

procedure List(symbol: char; var p1: P_elem);
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

function P(curr: char): integer;
begin
  if curr in '()' then P := 0;
  if curr in '+-' then P := 1;
  if curr in '*/' then P := 2;
end;


procedure start();
var
  otvet: string;
  symbol: char;

begin
  assign(f, 'infix.txt');
  reset(f);
  while not eof(f) do
  begin
    read(f, symbol);
    if symbol in '0123456789' then begin
      otvet += symbol;
    end
    else begin
      if symbol in '-+*/' then begin
        otvet += ' ';
        while (head <> nil) and (P(symbol) <= P(head^.data)) do
        begin
          otvet += head^.data;
          kill_head(head);
        end;
        List(symbol, head);
      end;
    end;
    if symbol = '(' then List(symbol, head);
    if symbol = ')' then begin
      while (head <> nil) and (head^.data <> '(') do
      begin
        otvet += head^.data;
        kill_head(head);
      end;
      if (head <> nil) and (head^.data <> '(') then begin
        writeln('Неверно указаны скобки, проверьте внимательно!');
        exit(); 
      end
      else begin
        kill_head(head);
      end;
    end;
  end;
  while (head <> nil) do
  begin
    if not (head^.data in '()') then begin
      otvet += head^.data;
      kill_head(head);
    end
    else begin
      writeln('Неверно указаны скобки, проверьте внимательно!');
      exit();
    end;
  end;
  close(f);
  for var i := length(otvet) downto 1 do
  begin
    if (otvet[i] = ' ') then begin
      if ((otvet[i + 1] in '+-*/') or (otvet[i - 1] in '+-*/')) then
        delete(otvet, i, 1);
    end;
  end;
  writeln(otvet);
  assign(f, 'postfix.txt');
  rewrite(f);
  write(f, otvet);
  close(f);
  writeln('Программа успешно завершена');
end;

begin
  start();
end.