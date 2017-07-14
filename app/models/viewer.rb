require 'pry'

class Viewer
  
  attr_accessor :first_name, :last_name

  @@all = Array.new

  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	self.all.find { |viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
  	Rating.new(score, self, movie)
  end

end


Pry.start
