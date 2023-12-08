unit search_record;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  custom_types in 'custom_types.pas';

  { TForm3 }

type TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public
    DataFile: df;
    z: zap;
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var c: integer; fam: string[22];
begin
  c:=1;
  fam:=edit1.text;
  while not eof(datafile) do
  begin
    read(datafile,z);
    if fam=z.fam then
       begin
          c:=0;
          edit2.text:=z.name;
          edit3.text:=z.fon;
          edit4.text:=z.adr;
          break;
       end;
  end;
  if c<>0 then
  begin
     edit3.text:='Нет данных';
  end;
  reset(datafile);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
closefile(form3.datafile);
close;
end;

end.

