unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    ListBox1: TListBox;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  arr: realArray;
  length: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var str, curr: string; c: char;
begin
     length := 0;
     str := inputbox('Числа', 'Введите числа', '');
     for c in str do
     begin
          if c = ' ' then
          begin
            length := length + 1;
            arr[length] := strtofloat(curr);
            curr := '';
          end
          else
          begin
               curr := curr + c;
          end;
     end;
     length := length + 1;
     arr[length] := strtofloat(curr);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
begin
     memo1.clear;
  for i := 1 to length do
  begin
       memo1.lines.append(floattostr(arr[i]));
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var aver: real;   i: integer;
begin
     aver := avg(length, arr);
     if (aver = 0) then
        showmessage('Среднее 0')
     else
         label1.caption := floattostr(aver);
     for i :=  1 to length do
     begin
     listbox1.AddItem(floattostr(arr[i]));
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     form2.show;
     form1.hide;
end;

end.

