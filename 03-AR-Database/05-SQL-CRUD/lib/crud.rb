require 'sqlite3'

database_path = File.join(File.dirname(__FILE__), 'db/blog.sqlite')

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE posts(
    id INT PRIMARY KEY,
    name TEXT,
    source_url TEXT,
    rating INT,
    date DATETIME,
    post TEXT);
  }  # %q allows for multiline string in ruby
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  sql_insert = %q{INSERT INTO posts(
    'John',
    'www.abcd.fr',
    '0',
    #{DateTime.new},
    '#{post}');

  }
  db.execute(sql_insert)
end

def get_posts(db)
   #TODO: list all posts
   sql_get = %q{(SELECT post FROM posts;)}
   db.execute(sql_get)
end

def get_post(db, id)
  #TODO: get a specific post
  sql_get = %q{(SELECT * FROM posts WHERE id=#{id};)}
  db.execute(sql_get)
end

def update_post(db, id, name)
	#TODO: update a post's name in your db
  sql_update = %q{( UPDATE posts
    SET name = '#{name}'
    WHERE id =' #{id}';
    )}
end

def delete_posts(db)
  #TODO: delete a post in your db
  sql_delete = %q{(DELETE FROM posts;)}
  db.execute(sql_delete)
end

def delete_post(db, id)
  #TODO: delete a specific post in your db
  sql_delete = %q{(DELETE FROM posts
      WHERE id = '#{id}';)}
  db.execute(sql_delete)
end
create_scheme(SQLite3::Database.new('db/news.sqlite'))