require 'sqlite3'

# opens the database

database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)


def number_of_rows(db, table_name)
  #TODO: count number of rows in table table_name
  nb_rows = db.execute "SELECT COUNT(*) FROM #{table_name}"
  nb_rows.flatten[0]
end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
  sorted_artist = db.execute "SELECT Name FROM Artist ORDER BY Name;"
  sorted_artist.flatten
end

def love_tracks(db)
  #TODO: return array of love songs
  love = db.execute "SELECT Name FROM Track WHERE Name like '%love%' "
  love.flatten
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
  long = db.execute "SELECT Name FROM Track WHERE Milliseconds > #{(min_length * 60000)};"
  long.flatten
end

#p number_of_rows(db, "Artist")
#puts sorted_artists(db)
#p love_tracks(db)
puts long_tracks(db, 45).length
