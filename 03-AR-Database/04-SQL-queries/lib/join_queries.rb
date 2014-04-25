require 'sqlite3'

# opens the database
DATABASE_PATH = "lib/db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute ("SELECT Track.Name, Album.title, Artist.name
              FROM Track, Album, Artist
              WHERE Track.AlbumId = Album.AlbumId AND Album.ArtistId = Artist.ArtistId")
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  tracks = 0
  length_tracks = 0

  a = db.execute ("SELECT Count(Track.name), Avg(Track.Milliseconds)
                  FROM Track
                  INNER JOIN Genre
                  WHERE Genre.GenreId = #{category}")

  #a.each do |track|
  #  tracks += 1
  #  length_tracks += track[1].to_i
  # end
  #
  # stats = {nb_tracks: tracks,
            #average_length: length_tracks/tracks}
   {nb_tracks: a.flatten[0], avg_length: a.flatten[1]}
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  db.execute ("SELECT a.name, COUNT(t.TrackId)
              FROM Track t
              INNER JOIN Album al
              ON t.AlbumId = al.AlbumId
              INNER JOIN Artist a
              ON al.ArtistId = a.ArtistId
              INNER JOIN Genre g
              ON g.GenreId = t.GenreId
              WHERE (g.name = 'Rock')
              GROUP BY a.name
              ORDER BY COUNT(t.TrackId) DESC
              LIMIT 5")
end

p detailed_tracks(db)
p stats_on(db, 1)
p top_five_rock_artists(db)