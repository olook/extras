class SurveyController < ApplicationController
  def home
  end

  def create
    #just a PoC
    #we will use real objects(OO) later
    @profiles = {
      "a" => 0,
      "b" => 0,
      "c" => 0
    }
    3.times do |i|
      relevants = ["question_1"]
      index = "question_#{i}"
      point = (relevants.include? index) ? 2 : 1
      @profiles[params[index]] += point
    end
  end
end
