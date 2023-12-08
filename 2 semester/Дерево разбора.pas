type 
  tree=^PNode;
 PNode=record
 data:string;
 left:tree;
 right:tree;
 prev:tree;
end;

procedure pref(Node: tree);
begin
if Node <> nil then begin
write(Node^.data);
pref(Node^.left);
pref(Node^.right);
end;
end;

procedure post(Node: tree);
begin
if Node <> nil then begin
post(Node^.left);
post(Node^.right);
write(Node^.data);
end;
end;

procedure infix(Node: tree);
begin
if Node <> nil then begin
infix(Node^.left);
write(Node^.data);
infix(Node^.right);
end;
end;

procedure splitExpression(s:string; var sosna:tree);
var save:tree;
direction:string;
begin
new(sosna);
sosna^.prev:=nil;
direction:='left';
for var i:=1 to length(s) do begin
  if  s[i]='(' then begin
    new(sosna^.left);
    save:=sosna;
    sosna:=sosna^.left;
    direction:='left';
    sosna^.prev:=save;
    end;
    if (s[i] in ['+','-','*','/']) and (sosna<>nil) and (sosna^.data ='')  then
    begin
      sosna^.data:=s[i];
      new(sosna^.right);
      save:=sosna;
      sosna:=sosna^.right;
      direction:='right';
      sosna^.prev:=save;
    end
    else if (s[i] in ['+','-','*','/']) and (sosna=nil) then
    begin
     new(sosna);
      sosna^.data:=s[i];
      new(sosna^.right);
      save:=sosna;
      sosna:=sosna^.right;
      direction:='right';
      sosna^.prev:=save;
    end
    else if (s[i] in ['+','-','*','/']) and (sosna<>nil) and (sosna^.data <>'') then
    begin
    save:=sosna;
    sosna:=sosna^.prev;
    if sosna = nil then 
      begin
      new(sosna);
      sosna^.prev:=nil;
      sosna^.left:=save;
      end
      else  begin 
     save:=sosna^.right;
     new(sosna^.right);
     sosna:=sosna^.right;
     sosna^.left:=save;
     end;
     sosna^.data:=s[i];
     new(sosna^.right);
      save:=sosna;
      sosna:=sosna^.right;
      sosna^.prev:=save;
      direction:='right'
    end;
    if s[i] in ['0'..'9'] then
    begin
      sosna^.data:=s[i];
      if direction='left' then 
      begin
        save:=sosna;
         sosna:=sosna^.prev;
         if sosna=nil then begin
           new(sosna);
           sosna^.left:=save;
           sosna^.prev:=nil;
         end
         else sosna^.left:=save;
      end
      else if direction = 'right' then
      begin
         save:=sosna;
         sosna:=sosna^.prev;
         if sosna=nil then begin
           new(sosna);
           sosna^.right:=save;
           sosna^.prev:=nil;
         end
         else sosna^.right:=save;
      end;
    end;
    if s[i]=')' then begin 
    save:=sosna;
    sosna:=sosna^.prev;
    direction:='left';
    if sosna=nil then begin
      new(sosna);
      sosna^.left:=save;
      end;
    end;
  end;
end;

var s:string;
 sosna:tree;
begin 
  write('Введите выражение: ');
  readln(s);
  splitExpression(s,sosna);
  infix(sosna);
  writeln();
  post(sosna);
  writeln();
  pref(sosna);
end.