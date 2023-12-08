var
  s: string;

procedure swap();
begin
  for var i := 1 to length(s) do
  begin
    if s[i] = '0' then s[i] := '1'
    else s[i] := '0'
  end;
end;

begin
  write('Введите строку S: ');
  readln(s);
  swap();
  write(s);
end.