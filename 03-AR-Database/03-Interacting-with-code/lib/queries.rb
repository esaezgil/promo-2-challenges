require 'sqlite3'

# opens the database
DATABASE_PATH = "lib/db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def number_of_rows(db, table_name)
  #TODO: count number of rows in table table_name
  nb_rows = db.execute "SELECT COUNT(*) FROM #{table_name}"
end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
  sorted_artist = db.execute "SELECT Name FROM Artist ORDER BY Name;"
end

def love_tracks(db)
  #TODO: return array of love songs
  love = db.execute "SELECT Name FROM Track WHERE Name like '% love %' "
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
  long = db.execute "SELECT Name FROM Track WHERE Milliseconds > #{(min_length * 60000)};"
end

p number_of_rows(db, "Artist")
puts sorted_artists(db)
p love_tracks(db)
p long_tracks(db, 60)