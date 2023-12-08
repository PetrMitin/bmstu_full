program n3;

var result, next_result, step: extended; iterations, divisor: integer;
const delta: real = 1e-3;

function Pow(x: extended; power: integer): extended;
       var res: extended = 1; i: integer;
       begin
            for i := 1 to power do
                res := res * x;
            pow := res;
       end;

function LengthOfLineFromStartToEnding(start, ending: extended): extended;
         var y1, y2, abs_x, abs_y, res: extended;
         begin
           y1 := Pow(start, 3) / 2;
           y2 := Pow(ending, 3) / 2;
           abs_x := abs(ending - start);
           abs_y := abs(y2 - y1);
           res := sqrt(abs_x*abs_x + abs_y*abs_y);
           LengthOfLineFromStartToEnding := res;
         end;

function LengthOfFullLine(step: extended): extended;
        var res, start, ending: extended;
        begin
             start := 0;
             ending := start + step;
             res := 0;
             while abs(ending - 4) > 1e-1 do
                   begin
                     res := res + LengthOfLineFromStartToEnding(start, ending);
                     start := ending;
                     ending := ending + step;
                   end;
             LengthOfFullLine := res;
        end;

begin
  divisor := 1;
  step := 4 / divisor;
  result := LengthOfFullLine(step);
  next_result :=  LengthOfFullLine(4 / (divisor * 2));
  while abs(result - next_result) > delta do
        begin
          step := 4 / (divisor * 2);
          divisor := divisor * 2;
          result := next_result;
          next_result := LengthOfFullLine(4 / (divisor * 2));
        end;
  writeln('Result = ', result, '. Was made ' , divisor, ' iterations');
  readln;
end.
