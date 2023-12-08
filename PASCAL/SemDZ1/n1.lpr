program n1;

var result, next_result, x: extended; iterations: integer;
const delta: real=1e-4;

function Pow(x: extended; power: integer): extended;
         var res: extended = 1; i: integer;
         begin
              for i := 1 to power do
                  res := res * x;
              pow := res;
         end;

function Arctan(x: extended; depth: integer): extended;
         var res: extended; counter, sign, power: integer;
         begin
              counter := 0;
              res := 0;
              while counter < depth do
                    begin
                         power := (counter * 2 + 1);
                         if (counter mod 2) = 0 then
                            begin
                                 sign := 1;
                            end
                         else
                             begin
                                 sign := -1;
                             end;
                         res := res + sign * pow(x / power, power);
                         writeln(x, ' ', power, ' ', counter, ' ', sign);
                         counter := counter + 1;
                    end;
              Arctan := res;
         end;

begin
  readln(x);
  iterations := 1;
  result := Arctan(x, iterations);
  next_result := Arctan(x, iterations + 1);
  while abs(result - next_result) > delta do
        begin
          iterations := iterations + 1;
          result := Arctan(x, iterations);
          next_result := Arctan(x, iterations + 1);
        end;
  writeln('Arctan ', x, ' = ', result);
  writeln('Arctan next ', x, ' = ', next_result);
  writeln(iterations, ' iterations was made');
  readln;
end.

