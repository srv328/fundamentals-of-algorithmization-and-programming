const
  persons = 1000; //50 или 100 или 200 или 500 или 1000

type
  data_record = record
    surname: string[20];
    rank: 1..11;
    liter, sex: string[1];
    height, weight: real;
  end;


var
  data_base, otvet: text;
  date: data_record;
  data: array of data_record;
  line: string;
  num: integer;
  quit: boolean;
  en3 := Encoding.GetEncoding(65001);

procedure vvod();
var
  road, file_chars: string;
  count: integer;
begin
  road := persons + '.txt';
  assign(data_base, road);
  if not fileexists(road) then begin
    writeln('Файл ', road, ' не найден! Измените 2-ю строку программы для корректной работы.');
    quit := True;
    
  end;
  reset(data_base, en3);
  while not EOF(data_base) do
  begin
    readln(data_base, file_chars);
    num := num + 1;
    count += length(file_chars);
  end;
  if count = 0 then begin
    writeln('Файл пуст');
    quit := True;
    
  end;
  close(data_base);
  reset(data_base, en3);
  num := 0;
  while not EOF(data_base) do
  begin
    readln(data_base, file_chars);
    num := num + 1;
    if (file_chars.ToWords(' ')).Length <> 6 then begin
      writeln('Неверное количество столбцов в строке номер: ', num);
      quit := True;
      
    end;
  end;
  close(data_base);
  if num <> persons then begin
    writeln('Количество строк в файле не совпадает с количеством человек. Проверьте вводимые данные.');
    quit := True;
    
  end;
end;

procedure records();
var
  road: string;
begin
  road := persons + '.txt';
  assign(data_base, road);
  reset(data_base, en3);
  num := 1;
  while not EOF(data_base) do
  begin
    readln(data_base);
    num := num + 1;
  end;
  close(data_base);
  data := new data_record[num];
  num := 0;
  assign(data_base, road);
  reset(data_base, en3);
  while not EOF(data_base) do
  begin
    readln(data_base, line);
    date.surname := line.ToWords(' ')[0].ToString;
    for var i := 1 to length(date.surname) do
    begin
      if date.surname[i] not in 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ' then begin
        quit := True;
        if quit then writeln('Невозможно распознать фамилию в строке номер: ', num + 1);
        
      end;
    end;
    try
      date.rank := line.ToWords(' ')[1].ToInteger;
      if (date.rank > 11) or (date.rank < 1) then begin
        writeln('В русских школах только 11 классов! Ошибка в строке: ', num + 1);
        quit := True;
        
      end;
    except
      writeln('Невозможно распознать класс в строке номер: ', num + 1);
      quit := True;
    
    end;
    if line.ToWords(' ')[2].ToString.Length <> 1 then begin
      writeln('Литер состоит из одного символа!. Ошибка в строке: ', num + 1);
      quit := True;
    end;
    date.liter := line.ToWords(' ')[2].ToString;
    if date.liter not in 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ' then begin
      writeln('Литер может содержать только русские символы от А до я. Ошибка в строке: ', num + 1);
      quit := True;
      
    end;
    date.sex := line.ToWords(' ')[3];
    if (line.ToWords(' ')[3].Length <> 1) then begin
      writeln('Пол обозначается одним символом! Ошибка в строке: ', num + 1);
      quit := True;
      
    end;
    
    if (date.sex in 'qwertyuiopasdfghjklzxcvbnm') then begin
      writeln('Невозможно распознать пол ученика в строке номер: ', num + 1);
      quit := True;
      
    end;
    
    if (date.sex not in 'ЖжМм') then begin
      writeln('Пол обозначается следующими символами: Ж ж М м. Ошибка в строке: ', num + 1);
      quit := True;
    end;
    try
      date.weight := line.ToWords(' ')[4].ToReal;
      if (date.weight) <= 0 then begin
        writeln('Вес ученика обязательно больше нуля! Ошибка в строке: ', num + 1);
        quit := True;
      end;
    except
      writeln('Невозможно распознать вес ученика в строке номер: ', num + 1);
      quit := True;
    end;
    try
      date.height := line.ToWords(' ')[5].ToReal;
      if (date.height) <= 0 then begin
        writeln('Рост ученика обязательно больше нуля! Ошибка в строке: ', num + 1);
        quit := True;
      end;
    except
      writeln('Невозможно распознать рост ученика в строке номер: ', num + 1);
      quit := True;
    end;
    data[num] := date;
    num := num + 1;
  end;
  close(data_base);
end;

procedure max_min_parallels();
var
  rost_min: array[1..11] of real;
  rost_max: array[1..11] of real;

begin
  for var i := 1 to 11 do
  begin
    rost_min[i] := 9999;
    rost_max[i] := -1;
  end;
  for var i := 0 to persons - 1 do
  begin
    if data[i].height < rost_min[data[i].rank] then
      rost_min[data[i].rank] := data[i].height;
    if data[i].height > rost_max[data[i].rank] then
      rost_max[data[i].rank] := data[i].height;
  end;
  assign(otvet, 'output.txt');
  rewrite(otvet, en3);
  writeln(otvet, '1 вопрос: ');
  writeln(otvet);
  for var i := 1 to 11 do
  begin
    write(otvet, i, ' класс: ', 'Минимальный рост: ', rost_min[i], ' Максимальный рост: ', rost_max[i]);
    write(otvet, #10);
  end;
  writeln(otvet);
  close(otvet);
end;


procedure percent_of_girls();
var
  count: integer;
begin
  count := 0;
  for var i := 0 to persons - 1 do
  begin
    if (data[i].sex = 'Ж') and (data[i].weight > 60) then count += 1;
  end;
  assign(otvet, 'output.txt');
  append(otvet, en3);
  writeln(otvet, '2 вопрос: ');
  writeln(otvet);
  writeln(otvet, 'Процент девочек, чей вес превышает 60кг: ', round(count / persons * 100, 2), ' процентов');
  close(otvet);
end;

procedure imt();
var
  count: integer;
begin
  count := 0;
  for var i := 0 to persons - 1 do
  begin
    if (data[i].rank >= 10) and ((100 * data[i].weight / data[i].height) <= 25) and ((100 * data[i].weight / data[i].height) >= 20) then begin
      count := count + 1;
    end;
  end;
  assign(otvet, 'output.txt');
  append(otvet, en3);
  writeln(otvet);
  writeln(otvet, '3 вопрос: ');
  writeln(otvet);
  writeln(otvet, 'Ученики 10 и 11 классов, чей индекс массы тела находится между 20 и 25: ', count, ' человек');
  close(otvet);
end;

begin
  vvod();
  if quit then exit();
  records();
  if quit then exit();
  max_min_parallels();
  percent_of_girls();
  imt();
  writeln('Программа завершена корректно.');
end.