unit initial_screen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  add_record in 'add_record.pas',
  search_record in 'search_record.pas',
  custom_types in 'custom_types.pas';

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private

  public

  end;

var f:df; z:zap; size: integer; Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
assignfile(f, 'telefon.dat');
{$I-} Reset(F); {$I+}
if ioresult=0 then
   begin
        size := FileSize(f);
        seek(f,size);
   end
else
   rewrite(f);
Form2.DataFile := f;
Form2.Show;
Form2.Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
assignfile(f, 'telefon.dat');
reset(f);
Form3.DataFile := f;
Form3.Show;
Form3.Edit1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Close;
end;

end.

