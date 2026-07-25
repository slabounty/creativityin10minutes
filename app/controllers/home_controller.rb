class HomeController < ApplicationController
  def index
    @prompt = Prompt.first
    @medium = Medium.first

    puts "@prompt = #{@prompt}"
    puts "@medium = #{@medium}"
  end
end
