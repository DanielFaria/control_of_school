class PagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    puts "teste"
  end

end
