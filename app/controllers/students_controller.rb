class StudentsController < ApplicationController
  def index
      @students = Student.all
  end

  def show
    id = params[:id]
    @student = Student.find(id)
  end

  def new
#default: render 'new' template
  end

  def create
    @student = Student.create!(params[:student])
    flash[:notice] = "#{@student.name} was successfully created."
    redirect_to students_path
  end

  def edit
    @student = Student.find params[:id]
  end

  def destroy
    @student = Student.find params[:id]
    @student.destroy
    flash[:notice] = "Student '#{@student.name}' deleted."
    redirect_to student_path
  end

  def update
    @student = Student.find params[:id]
    @student.update_attributes!(params[:student])
    flash[:notice] = "#{@student.name} was successfully updated."
    redirect_to student_path(@student)
  end
end
