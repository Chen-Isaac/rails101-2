class WelcomeController < ApplicationController
  def index_try
    flash[:notice] = "Good morning!"
  end
end
