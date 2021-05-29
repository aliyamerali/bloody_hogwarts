class CoursesController < ApplicationController

  def index
    @courses = Course.alphabetically
  end


end
