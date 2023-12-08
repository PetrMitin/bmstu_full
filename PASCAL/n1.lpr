program n1;

var s: string; s1, s2, s3: set of 'a'..'z'; elem: char; i: integer;
begin
     readln(s);
     s := s + ' ';
     s1 := [];
     i := 1;
     while s[i] <> ' ' do
           begin
             s1 := s1 + [s[i]];
             i := i + 1;
           end;
     for elem in s1 do
         writeln(elem);
     readln;
end.

