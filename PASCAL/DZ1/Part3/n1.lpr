program n1;

function Factorial(x: integer): extended;
         var res: extended; i: longint;
         begin
           res := 1;
           for i := 1 to x do
               res := res * i;
           Factorial := res;
         end;

function Pow(x: extended; power: integer): extended;
         var i: longint; res: extended;
         begin
           res := 1;
           for i := 1 to power do
               res := res * x;
           Pow := res;
         end;

var eps, result, next_term: real; depth: longint;
begin
     writeln('Enter epsilon');
     readln(eps);
     depth := 0;
     result := 0;
     repeat
           next_term := Pow(-1, depth) * Pow(3, 2 * depth + 1) / Factorial(2 * depth + 1);
           result := result + next_term;
           depth := depth + 1;
     until abs(next_term) < eps;
     writeln('Sin(3) = ', result, ' iterations = ', depth);
     readln;
end.

