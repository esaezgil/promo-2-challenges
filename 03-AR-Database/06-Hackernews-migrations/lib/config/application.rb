require 'sqlite3'
require 'active_record'
require 'pathname'
require 'yaml'
<<<<<<< HEAD
=======

>>>>>>> d5b69787ee8e1760e7bbac00233db9b948dffab0

# gets root of current directory
APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

# loads the yml database config file
DB_CONFIG = YAML::load(IO.read(File.join(File.dirname(__FILE__),'database.yml')))

# gets the path of the database
DB_PATH =  APP_ROOT.join(DB_CONFIG["development"]["database"])

ActiveRecord::Base.configurations = DB_CONFIG
ActiveRecord::Base.establish_connection('development')



