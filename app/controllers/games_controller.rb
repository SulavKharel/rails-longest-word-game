require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(11)
  end

  def score
    @score = 0
    @answer = params[:answer]
    @length = @answer.length
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    data_serialized = open(url).read
    data = JSON.parse(data_serialized)
    data['found']
    @score = @length * 10 if data['found']
  end
end
