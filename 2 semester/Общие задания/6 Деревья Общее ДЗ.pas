type
  tree = ^PNode;
  PNode = record
    data: string;
    left: tree;
    right: tree;
    parent: tree;
  end;

type
  P_elem = ^elem;
  elem = record
    data: real;
    next: p_elem;
  end;


var
  pref_otvet, infix_otvet, post_otvet, virazenie: string;
  root: tree;
  skobki, chisla: boolean;
  head: P_elem;

procedure pref(Node: tree);
begin
  if Node <> nil then begin
    pref_otvet += Node^.data;
    pref(Node^.left);
    pref(Node^.right);
  end;
end;

procedure post(Node: tree);
begin
  if Node <> nil then begin
    post(Node^.left);
    post(Node^.right);
    post_otvet += Node^.data;
  end;
end;

procedure infix(Node: tree);
begin
  if Node <> nil then begin
    infix(Node^.left);
    infix_otvet += Node^.data;
    infix(Node^.right);
  end;
end;

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

procedure start(symbol: string);
var
  a, b: real;
begin
  for var i := 1 to Length(symbol) do
  begin
    if symbol[i] in '0123456789' then begin
      List(symbol[i].ToDigit, head);
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
  writeln('Ответ: ', head^.data);
  kill_head(head);
  writeln('Программа завершена.');
end;

procedure proverka(virazenie: string);
var
  otk, zak: integer;

begin
  skobki := False;
  chisla := False;
  for var i := 1 to length(virazenie) do
  begin
    if (i + 1 <= length(virazenie)) and (virazenie[i] in ['0'..'9']) and (virazenie[i + 1] in ['0'..'9']) then chisla := True;
    if (i + 1 <= length(virazenie)) and (virazenie[i] = '(') and (virazenie[i + 1] = ')') then skobki := True;
    if (virazenie[length(virazenie)] = ')') and (virazenie[length(virazenie) - 4] <> '(') then skobki := True;
    if virazenie[i] = '(' then inc(otk);
    if virazenie[i] = ')' then begin
      inc(zak);
      if otk = 0 then skobki := True;
    end;
  end;
  if otk <> zak then skobki := True;
  if chisla then writeln('Вводить можно только однозначные числа 0..9!');
  if skobki then writeln('Проверьте скобки!'); 
end;


procedure creation(virazenie: string; var root: tree);
var
  parent_data, parent_data2: tree;
  side: string;
begin
  new(root);
  root^.parent := nil;
  side := 'left';
  for var i := 1 to length(virazenie) do
  begin
    if  virazenie[i] = '(' then begin
      new(root^.left);
      parent_data := root;
      root := root^.left;
      side := 'left';
      root^.parent := parent_data;
    end;
    if (virazenie[i] in '+-*/') and (root <> nil) and (root^.data = '')  then
    begin
      root^.data := virazenie[i];
      new(root^.right);
      parent_data := root;
      root := root^.right;
      side := 'right';
      root^.parent := parent_data;
    end
    else if (virazenie[i] in '+-*/') and (root = nil) then
    begin
      new(root);
      root^.data := virazenie[i];
      new(root^.right);
      parent_data := root;
      root := root^.right;
      side := 'right';
      root^.parent := parent_data;
    end
    else if (virazenie[i] in '+-*/') and (root <> nil) and (root^.data <> '') then
    begin
      parent_data := root;
      root := root^.parent;
      if root = nil then 
      begin
        new(root);
        root^.parent := nil;
        root^.left := parent_data;
      end
      else  begin
        parent_data := root^.right;
        new(root^.right);
        parent_data2 := root;
        root := root^.right;
        root^.parent := parent_data2;
        root^.left := parent_data;
      end;
      root^.data := virazenie[i];
      new(root^.right);
      parent_data := root;
      root := root^.right;
      root^.parent := parent_data;
      side := 'right'
    end;
    if virazenie[i] in '0123456789' then
    begin
      root^.data := virazenie[i];
      if side = 'left' then 
      begin
        parent_data := root;
        root := root^.parent;
        if root = nil then begin
          new(root);
          root^.left := parent_data;
          root^.parent := nil;
        end
        else root^.left := parent_data;
      end
      else if side = 'right' then
      begin
        parent_data := root;
        root := root^.parent;
        if root = nil then begin
          new(root);
          root^.right := parent_data;
          root^.parent := nil;
        end
        else root^.right := parent_data;
      end;
    end;
    if virazenie[i] = ')' then begin
      parent_data := root;
      root := root^.parent;
      side := 'left';
      if root = nil then begin
        new(root);
        root^.left := parent_data;
      end;
    end;
  end;
end;


begin
  write('Введите выражение: ');
  readln(virazenie);
  proverka(virazenie);
  if skobki or chisla then exit;
  creation(virazenie, root);
  write('Инфиксная запись: ');
  infix(root);
  writeln(infix_otvet);
  write('Постфиксная запись: ');
  post(root);
  writeln(post_otvet);
  write('Префиксная запись: ');
  pref(root);
  writeln(pref_otvet);
  write('Результат выражения: ');
  start(post_otvet);
end.