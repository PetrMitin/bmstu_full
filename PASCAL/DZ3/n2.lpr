program n2;
type Ring = object Mass: single;
                   NameOfMetal: string;
                   MetalContent: single;
                   procedure Init(IMass: single; INameOfMetal: string; IMetalContent: single);
                   procedure ShowInfo();
                   function CountMassOfMetal(): single;
                   end;

type RingWithGem = object(Ring) MassWithoutGem: single;
                                NameOfGem: string;
                                MassOfGem: single;
                                procedure WithGemInit(IMassWithoutGem: single; INameOfMetal: string; IMetalContent: single; INameOfGem: string; IMassOfGem: single);
                                procedure WithGemShowInfo();
                                function CountFullMass(): single;
                                function CountMassOfMetal(): single;
                                end;
procedure Ring.Init(IMass: single; INameOfMetal: string; IMetalContent: single);
          begin
            Self.Mass := IMass;
            Self.NameOfMetal := INameOfMetal;
            Self.MetalContent := IMetalContent;
          end;

procedure Ring.ShowInfo();
          begin
            writeln('Full mass: ', Self.Mass);
            writeln('Name of metal: ', Self.NameOfMetal);
            writeln('Metal content: ', Self.MetalContent);
          end;

function Ring.CountMassOfMetal(): single;
         begin
           Result := Self.Mass * Self.MetalContent;
         end;

procedure RingWithGem.WithGemInit(IMassWithoutGem: single; INameOfMetal: string; IMetalContent: single; INameOfGem: string; IMassOfGem: single);
          begin
            Self.MassWithoutGem := IMassWithoutGem;
            Self.NameOfGem := INameOfGem;
            Self.MassOfGem := IMassOfGem;
            Self.Init(Self.CountFullMass(), INameOfMetal, IMetalContent);
          end;

procedure RingWithGem.WithGemShowInfo();
          begin
               writeln('Name of gem: ', Self.NameOfGem);
               writeln('Mass of gem: ', Self.MassOfGem);
               writeln('Mass without gem: ', Self.MassWithoutGem);
               Self.ShowInfo();
          end;

function RingWithGem.CountMassOfMetal(): single;
         begin
              Result := Self.MassWithoutGem * Self.MetalContent;
         end;

function RingWithGem.CountFullMass(): single;
         begin
              Result := Self.MassOfGem + Self.MassWithoutGem;
         end;
var Ring1: Ring; RingWithGem1: RingWithGem;
begin
     Ring1.Init(10, 'Gold', 0.585);
     RingWithGem1.WithGemInit(10, 'Silver', 0.500, 'Emerald', 5);
     writeln('Ring 1');
     Ring1.ShowInfo();
     writeln('Mass of metal ring1: ', Ring1.CountMassOfMetal());
     writeln;
     writeln('Ring with gem 1');
     RingWithGem1.WithGemShowInfo();
     writeln('Mass of metal ring with gem 1: ', RingWithGem1.CountMassOfMetal());
     readln;
end.

