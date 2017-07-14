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

class Rating
  
  attr_accessor :score, :viewer, :movie

  @@all = Array.new

  def initialize(score, viewer, movie)
  	self.score = score
  	self.viewer = viewer
  	self.movie = movie
  	@@all << self
  end

  def self.all 
  	@@all
  end
  
end

class Movie

  attr_accessor :title

  @@all = Array.new

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
  	@@all 
  end

  def self.find_by_name(title)
  	self.all.find { |movie| movie.title == title}
  end

  def ratings
  	Rating.all.select { |rating| rating.movie == self}
  	# this will go through the ratings all array and find the movies
  	# that are this instance
  end

  def viewers
  	self.ratings.map { |rating| rating.viewer}
  	# this first calls on the ratings method to get an array of 
  	# all ratings associated with that movie. It them maps over
  	# the array to return the same number of viewers
  end

  def average_rating
  	ratings_array = self.ratings.map { |rating| rating.score }
  	ratings_array.inject{ |sum, e1| sum + e1}.to_f / ratings_array.size
  end

end



Pry.start