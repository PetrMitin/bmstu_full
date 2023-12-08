unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type rec = record
  name: string[50];
  price: real;
  country: string[50];
  filler: string[50];
  end;

type recArray = array [1..50] of rec;

  procedure sortByName(length: integer; var source: recArray);

  procedure formNewArray(maxPrice: real; sourceLength: integer; var source: recArray; var destLength: integer; var dest: recArray);

  function amountOfCategory(category: string; length: integer; var source: recArray) : integer;

  function getRec(str: string) : rec;

implementation

procedure sortByName(length: integer; var source: recArray);
var ischanged: boolean; i: integer; curr: rec;
begin
     ischanged := true;
     while ischanged do
     begin
       ischanged := false;
       for i := 1 to length-1 do
       begin
         if (source[i].name > source[i+1].name) then
         begin
           curr := source[i+1];
           source[i+1] := source[i];
           source[i] := curr;
           ischanged := true;
         end;
       end;
     end;
end;

procedure formNewArray(maxPrice: real; sourceLength: integer; var source: recArray; var destLength: integer; var dest: recArray);
var i: integer;
begin
     destLength := 0;
     for i := 1 to sourceLength do
     begin
       if (source[i].price < maxPrice) then
       begin
         destLength := destLength + 1;
         dest[destLength] := source[i];
       end;
     end;
end;

function amountOfCategory(category: string; length: integer; var source: recArray) : integer;
var i, res: integer;
begin
     for i := 1 to length do
     begin
       if (category = source[i].filler) then
          res := res + 1;
     end;
     amountOfCategory := res;
end;

function getRec(str: string) : rec;
var c: char; curr: string; res: rec; i: integer;
begin
     i := 0;
     for c in str do
     begin
          if c = ' ' then
          begin
               if i = 0 then
               begin
                    res.name := curr;
                    curr := '';
                    i := 1;
               end
               else if i = 1 then
               begin
                    res.price := strtofloat(curr);
                    curr := '';
                    i := 2;
               end
               else if i = 2 then
               begin
                    res.country := curr;
                    curr := '';
                    i := 3;
               end;
          end
          else
              curr := curr + c;
     end;
     res.filler := curr;;
end;

end.

