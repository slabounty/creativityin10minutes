class HomeController < ApplicationController
  def index
    @prompt = Prompt.order(Arel.sql("RANDOM()")).first
    @medium = Medium.order(Arel.sql("RANDOM()")).first
  end
end
