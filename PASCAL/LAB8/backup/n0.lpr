program n0;

var f1, f2: text; st: string;
begin
  assignfile(f1, 'f1.txt');
  assignfile(f2, 'f2.txt');
  reset(f1);
  rewrite(f2);
  while not eof(f1) do
        begin
        readln(f1, st);
        if st[1] = 'a' then
           begin
           writeln(st);
           writeln(f2, st);
           end;
        end;
  readln;
  close(f);
end.

