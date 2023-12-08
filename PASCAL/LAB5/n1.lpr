program n1;

var r: array[1..10, 1..10, 1..2] of char; i, j, k: integer;
begin
  for i := 1 to 10 do
      begin
        for j := 1 to 10 do
            begin
                 for k := 1 to 2 do
                     begin
                          if k = 1 then
                             r[i, j, k] := '!'
                          else
                              r[i, j, k] := '?';
                     end;
            end;
      end;
  for i := 1 to 10 do
      begin
        for j := 1 to 10 do
            begin
                 for k := 1 to 2 do
                     begin
                          write(r[i, j, k]);
                     end;
            end;
        writeln;
      end;
  readln;
end.

