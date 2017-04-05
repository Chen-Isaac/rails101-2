class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Good morning! Hello!"
  end
end
