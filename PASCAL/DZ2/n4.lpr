program n4;

Uses N4module;

function F(x: real): real;
           begin
             Result := sqrt(x);
           end;

function G(x: real): real;
           begin
             Result := sin(x) / 2;
           end;

var res, a, b: real;
begin
     res := 0;
     writeln('Enter a, b');
     readln(a, b);
     Maxim(@F, @G, a, b, res);
     writeln('Max distance between F and G is ', res);
     readln;
end.

