unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type rec = record
  surname: string[50];
  phone: string[12];
  end;

  type recArray = array [1..50] of rec;

  procedure findSurnames(threeDigits: string; sourceLength: integer; var source: recArray; var destLength: integer; var dest: recArray);

implementation

procedure findSurnames(threeDigits: string; sourceLength: integer; var source: recArray; var destLength: integer; var dest: recArray);
var i: integer;
begin
     destLength := 0;
     for i := 1 to sourceLength do
     begin
       if (source[i].phone[1] = threeDigits[1]) and (source[i].phone[2] = threeDigits[2]) and (source[i].phone[3] = threeDigits[3]) then
          begin
            destLength := destLength + 1;
            dest[destLength] := source[i];
          end;
     end;
end;

end.

