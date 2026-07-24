class HomeController < ApplicationController
  def index
    @prompt = Prompt.where(active: true).first
    @medium = Medium.where(active: true).first

    puts "@prompt = #{@prompt}"
    puts "@medium = #{@medium}"
  end
end
