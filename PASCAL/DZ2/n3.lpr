program n3;
{Дана непустая последовательность слов. Вывести в алфавитном порядке все латинские буквы, входящие в последовательность ровно один раз.}

var st: string; i: integer; ch: char; ans_set, found_set: set of 'A'..'Z';
begin
  writeln('Enter words with whitespace as separator');
  readln(st);
  ans_set := [];
  found_set := [];
  st := Upcase(st);
  for i := 1 to Length(st) do
      begin
           ch :=  st[i];
           if ch = ' ' then
              continue;
           if ch in found_set then
              ans_set := ans_set - [ch]
           else
             begin
               ans_set := ans_set + [ch];
               found_set := found_set + [ch];
             end;
      end;
  for ch in ans_set do
    write(ch, ' ');
  readln;
end.

