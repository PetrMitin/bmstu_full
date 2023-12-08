program n1;

uses wincrt;
var str, curr_str: string; ch: char; i, count_a, ans, substr_counter: integer;
begin
  str := '';
  curr_str := '';
  ans := 0;
  ch := 'a';
  while ch <> '!' do
    begin
         read(ch);
         str := str + ch;
    end;
  readln;
  writeln('Entered string: ', str);
  substr_counter := 1;
  count_a := 0;
  for i := 1 to Length(str) do
      begin
           ch := str[i];
           if ch = '.' then
              begin
                if count_a > 3 then
                   begin
                        ans := ans + 1;
                        writeln(curr_str, substr_counter);
                   end;
                curr_str := '';
                count_a := 0;
                substr_counter := substr_counter + 1;
              end
           else if ch = 'A' then
              count_a := count_a + 1;
      end;
  if ans = 0 then
     writeln('No substrings with more than 3 As')
  else
      writeln('Total substrings with more than 3 As: ', ans);
  readln;
end.

