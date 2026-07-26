class HomeController < ApplicationController
  def index
    @daily_prompt = DailyPrompt.for_today

    @prompt = @daily_prompt.prompt
    @medium = @daily_prompt.medium
  end
end
