unit add_record;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  custom_types in 'custom_types.pas';

type

  { TForm2 }

  TForm2 = class(TForm)
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
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
     z.fam:=Edit1.text;
     z.name:=Edit2.text;
     z.fon:=Edit3.text;
     z.adr:=Edit4.text;
     edit1.clear;
     edit2.clear;
     edit3.clear;
     edit4.clear;
     write(DataFile,z);
     edit1.setfocus;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
     closefile(form2.datafile);
     close;
end;

end.

