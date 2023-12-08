program n3;

type Film =
     object Name: string;
            CriticsRating, UsersRating: integer;
            procedure Init(IName: string; ICriticsRating, IUsersRating: integer);
            procedure ShowInfo();
            function CountAverageRating(): single;
            end;
     FilmsList =
     object NumberOfFilms: integer;
            Films: array[1..500] of Film;
            procedure Init(INumberOfFilms: integer; const IFilms: array of Film);
            procedure ShowInfo();
            function FindBestFilmByAverageRating(): Film;
            function FindWorstFilmByAverageRating(): Film;
            end;

     procedure Film.Init(IName: string; ICriticsRating, IUsersRating: integer);
               begin
                 Self.Name := IName;
                 Self.CriticsRating := ICriticsRating;
                 Self.UsersRating := IUsersRating;
               end;

     procedure Film.ShowInfo();
               begin
                 writeln('Name: ', Self.Name);
                 writeln('Critics rating: ', Self.CriticsRating);
                 writeln('Users rating: ', Self.UsersRating);
                 writeln;
               end;

     function Film.CountAverageRating(): single;
              begin
                Result := (Self.CriticsRating + Self.UsersRating) / 2;
              end;

     procedure FilmsList.Init(INumberOfFilms: integer; const IFilms: array of Film);
               var i: integer;
               begin
                 Self.NumberOfFilms := INumberOfFilms;
                 for i := 1 to INumberOfFilms do
                     Self.Films[i].Init(IFilms[i-1].Name, IFilms[i-1].CriticsRating, IFilms[i-1].UsersRating);
               end;

     procedure FilmsList.ShowInfo();
               var i: integer;
               begin
                 writeln('Number of films: ', Self.NumberOfFilms);
                 for i := 1 to Self.NumberOfFilms do
                     Self.Films[i].ShowInfo();
               end;

     function FilmsList.FindBestFilmByAverageRating(): Film;
              var currBestRating, currRating: single; i: integer; bestFilm: Film;
              begin
                currBestRating := 0;
                for i := 1 to Self.NumberOfFilms do
                    begin
                      currRating := Self.Films[i].CountAverageRating();
                      if currRating > currBestRating then
                         begin
                              bestFilm := Self.Films[i];
                              currBestRating := currRating;
                         end;
                    end;
                Result := bestFilm;
              end;

     function FilmsList.FindWorstFilmByAverageRating(): Film;
              var currWorstRating, currRating: single; i: integer; worstFilm: Film;
              begin
                currWorstRating := 5;
                for i := 1 to Self.NumberOfFilms do
                    begin
                      currRating := Self.Films[i].CountAverageRating();
                      if currRating < currWorstRating then
                         begin
                              worstFilm := Self.Films[i];
                              currWorstRating := currRating;
                         end;
                    end;
                Result := worstFilm;
              end;
var Films1: FilmsList; Film1, Film2: Film;
begin
  Film1.Init('1', 5, 5);
  Film2.Init('2', 4, 3);
  Film1.ShowInfo();
  Film2.ShowInfo();
  writeln('Avg1: ', Film1.CountAverageRating());
  writeln('Avg2: ', Film2.CountAverageRating());
  Films1.Init(2, [Film1, Film2]);
  Films1.ShowInfo();
  writeln('Best film: ');
  Films1.FindBestFilmByAverageRating().ShowInfo();
  writeln('Worst film: ');
  Films1.FindWorstFilmByAverageRating().ShowInfo();
  readln;
end.

