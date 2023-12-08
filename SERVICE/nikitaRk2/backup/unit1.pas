unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  f1: file of rec;
  f2: textfile;
  arr1, arr2: recArray;
  l1, l2: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
var price: real; i: integer;
begin
     price := strtofloat(inputbox('Цена', 'Введите максимальную цену', '100000'));
     assignfile(f2, 'dest.txt');
     rewrite(f2);
     formNewArray(price, l1, arr1, l2, arr2);
     for i := 1 to l2 do
     begin
          writeln(f2, arr2[i].name + ' ' + floattostr(arr2[i].price) + ' ' + arr2[i].country + ' ' + arr2[i].filler);
     end;
     closefile(f2);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var i: integer;
begin
     sortByName(l1, arr1);
     form2.StringGrid1.ColCount := 4;
     form2.StringGrid1.rowcount := 0;
     form2.show;
     for i := 1 to l1 do
     begin
          form2.StringGrid1.rowcount := i;
          form2.StringGrid1.cells[0, i-1] := arr1[i].name;
          form2.StringGrid1.cells[1, i-1] := floattostr(arr1[i].price);
          form2.StringGrid1.cells[2, i-1] := arr1[i].country;
          form2.StringGrid1.cells[3, i-1] := arr1[i].filler;
     end;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var req: string;
begin
     req := inputbox('Набивка', 'Введите тип набивки', '');

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var str: string; curr: rec;
begin
     assignfile(f1, 'source.dat');
     rewrite(f1);
     l1 := 0;
     for str in memo1.lines do
     begin
          curr := getRec(str);
          write(f1, curr);
          l1 := l1 + 1;
          arr1[l1] := curr;
     end;
     closefile(f1);
     memo1.clear;
end;

end.

