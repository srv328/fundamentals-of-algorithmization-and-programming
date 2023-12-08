var str:string;
    ch:char;
    int:integer;


procedure GetPosition(const str:string; ch:char; var int:integer);
//ищет в строке str символ ch и возращает позицию int
var i:integer;
begin
	int:=-1;
	for i:=1 to length(str) do if str[i]=ch then int:=i;
	write('Position of ',ch,' is: ',i);
end;

begin
  write('Put string: ');
  readln(str);
  write('What char are we search for? ');
  readln(ch);
  GetPosition(str,ch,int)
end.