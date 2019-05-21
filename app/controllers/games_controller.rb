require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    @score = 0
    @letters = params[:letters]
    @answer = params[:answer]
    @length = @answer.length
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    data_serialized = open(url).read
    data = JSON.parse(data_serialized)
    value = data['found']
    @score = @length * 10 if value || @letters.include?(@answer)
  end
end
