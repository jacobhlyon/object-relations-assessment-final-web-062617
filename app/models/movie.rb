require 'pry'

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
