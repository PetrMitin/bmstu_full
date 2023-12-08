program n1;

type
     ptr=^node;
     node=record point: ptr;
                 symb: char;
                 name: string[22];
                 end;

var q, p, r, last, n: ptr; isEven: boolean;
begin
  new(r);
  readln(r^.name);
  readln(r^.symb);
  r^.point := nil;
  readln(r^.name);
  while r^.name <> 'end' do
        begin
          q := r;
          new(r);
          readln(r^.symb);
          r^.point := q;
          readln(r^.name);
        end;
  q := r;
  last := r;
  new(p);
  p^.name := '';
  p^.symb := '#';
  p^.point := nil;
  isEven := False;
  while q <> nil do
        begin
             if isEven then
                begin
                  r := q^.point;
                  n := p;
                  q^.point := n;
                  n^.point := r;
                  new(p);
                  p^.name := '';
                  p^.symb := '#';
                  p^.point := nil;
                  q := n^.point;
                end
             else
                 q := q^.point;
             isEven := not isEven;
        end;
  q := last;
  while q <> nil do
        begin
             writeln(q^.symb);
             q := q^.point;
        end;
  q := last;
  while q <> nil do
        begin
             r := q^.point;
             dispose(q);
             q := r;
        end;
  readln;
end.

