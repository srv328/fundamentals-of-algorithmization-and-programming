const
  sogl = 'БВГДЖЗЙКЛМНПРСТФЧЦШЩбвгджзйклмнпрстфчцшщ';
var
  stroka: string;
  sogl_slova, last_sogl, sogl_more_1, done_set: set of char;
begin
  write('Задайте строку: ');
  readln(stroka);
  for var i := 1 to stroka.Length do begin
    stroka[i]:=Upcase(stroka[i]);
    if stroka[i] <> ' ' then begin
      if stroka[i] in sogl then sogl_slova += [stroka[i]];
      if (i = stroka.Length) or (stroka[i + 1] = ' ') then begin
        sogl_more_1 += last_sogl * sogl_slova;
        last_sogl += sogl_slova;
        sogl_slova := [];
      end;
    end;
  end;
  done_set := last_sogl - sogl_more_1; 
  if done_set <> [] then begin
    write('Согласные буквы, входящие в одно слово: ');
    for var i := 'А' to 'я' do begin
      if i in done_set then
        write(i, ' ');
    end;
    writeln;
  end
  else writeln('Неповторяющихся согласных нет.' );
  writeln('Программа завершена.');
end.