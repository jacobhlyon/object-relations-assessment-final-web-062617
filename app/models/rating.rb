require 'pry'

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


Pry.start
