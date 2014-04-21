require_relative 'cookbook'

class Controller
  attr_reader :cookbook
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = Cookbook.new(file)
  end

  def list
    cookbook.retrieve_all
  end

  def import
    cookbook.import(user_input)
  end

  def add(recipe)
    cookbook.create(recipe)
  end

  def delete(recipe)
    cookbook.destroy(recipe)
  end
  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end
