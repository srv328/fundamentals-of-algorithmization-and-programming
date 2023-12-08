const
  persons = 10;

type
  data_record = record
    surname: string[20];
    rating1, rating2, rating3: integer;
  end;


var
  data_base, otvet: text;
  date: data_record;
  data: array of data_record;
  line: string;
  num: integer;
  en3 := Encoding.GetEncoding(65001);

procedure split(line: string; var date: data_record);
var
  surn: string;
  i:integer;

begin
  i := 1;
  while line[i] <> ' ' do
  begin
    surn += line[i];
    i+=1;
  end;
  date.surname := surn;
  date.rating1 := line[i+1].ToDigit;
  date.rating2 := line[i+3].ToDigit;
  date.rating3 := line[i+5].ToDigit;
end;

procedure records();
var
  road: string;
begin
  road := persons + '.txt';
  assign(data_base, road);
  reset(data_base, en3);
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
    split(line, date);
    writeln('Ученик: ', date.surname,' Средний балл: ', round((date.rating1+date.rating2+date.rating3)/3,2));
    data[num] := date;
    num := num + 1;
  end;
  close(data_base);
end;



begin
  records();
  writeln;
  writeln('Программа завершена корректно.');
end.