unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,
  unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo2: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    StringGrid1: TStringGrid;
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  f1, f2: file of rec;
  source, dest: recArray;
  sourceLength, destLength: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem1Click(Sender: TObject);
var str, curr_str: string; c: char; curr: rec;
begin
  showmessage('Ввод файла');
  assignfile(f1, 'source.dat');
  rewrite(f1);
  for str in memo1.Lines do
  begin
       curr_str := '';
       for c in str do
       begin
            if c = ' ' then
            begin
                 curr.surname := curr_str;
                 curr_str := '';
            end
            else
                curr_str := curr_str + c;
       end;
       curr.phone := curr_str;
       write(f1, curr);
  end;
  closefile(f1);
  memo1.clear;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var curr: rec;
begin
     showmessage('Просмотр файла');
     assignfile(f1, 'source.dat');
     reset(f1);
     sourceLength := 0;
     stringgrid1.colcount := 2;
     stringgrid1.RowCount := 0;
     while not eof(f1) do
     begin
          read(f1, curr);
          sourceLength := sourceLength + 1;
          source[sourceLength] := curr;
          stringgrid1.RowCount := stringgrid1.RowCount + 1;
          stringgrid1.cells[0, sourceLength - 1] := curr.surname;
          stringgrid1.cells[1, sourceLength - 1] := curr.phone;
     end;
     closefile(f1);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var req: string; i: integer;
begin
     showmessage('Просмотр массива');
     req := InputBox('Поиск по телефону', 'Введите первые три цифры телефона', '000');
     if (length(req) < 3) then
        ShowMessage('Введите 3 корректные цифры!')
     else
     begin
          findSurnames(req, sourceLength, source, destLength, dest);
          if destLength > 0 then
          begin
            stringgrid1.RowCount := destLength;
            stringgrid1.colcount := 2;
            for i := 1 to destLength do
            begin
                 stringgrid1.cells[0, i - 1] := dest[i].surname;
                 stringgrid1.cells[1, i - 1] := dest[i].phone;
            end;
          end
          else
              ShowMessage('Массив пуст!');
     end;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var i: integer;
begin
  showmessage('Создание нового файла');
  assignfile(f2, 'dest.dat');
  rewrite(f2);
  for i := 1 to destLength do
  begin
       write(f2, dest[i]);
  end;
  closefile(f2);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
form1.close;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
var curr: rec;
begin
     showmessage('Чтение нового файла');
     assignfile(f2, 'dest.dat');
     reset(f2);
     while not eof(f2) do
     begin
          read(f2, curr);
          memo2.Lines.Add(curr.surname + ' ' + curr.phone);
     end;
end;

end.

