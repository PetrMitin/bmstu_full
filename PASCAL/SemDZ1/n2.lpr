program n2;
var k, fn, fn_next, result, counter:longint;
begin
  readln(k);
  if k = 0 then
     result := 0
  else if k = 1 then
     result := 1
  else
      result := 2;
      counter := 2;
      fn := 1;
      fn_next := 1;
      while counter < k do
            begin
               result := result + fn + fn_next;
               fn_next := fn_next + fn;
               fn := fn_next - fn;
               counter := counter + 1;
            end;
  writeln(result);
  readln;
end.

