class StudentsController < ApplicationController

  def index
    @students = Student.alphabetically
    @avg_age = Student.avg_age
  end

  def show
    @student = Student.find(params[:id])
  end
end
