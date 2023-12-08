program asss;

const good_set: set of 1..10 = [2, 6, 3]; bad_set: set of 1..10 = [1, 7, 9];
var elem: integer;
begin
     for good_set in good_set do
         writeln(good_set);
         readln;
end.

