# app/models/user.rb

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
