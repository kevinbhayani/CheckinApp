require 'json'

class StudentsController < ApplicationController
  def index
      @students = Student.all({:order => params[:sort]}) 
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
    redirect_to students_path
  end

  def update
    @student = Student.find params[:id]
    @student.update_attributes!(params[:student])
    flash[:notice] = "#{@student.name} was successfully updated."
    redirect_to student_path(@student)
  end

  def getStudents
    @students = Student.all
    #jsonArray = JSON.
    render :text => jsonArray
  end

  def newStudent
    #jsonStudent = params[:newStudent]
    #parsedStudent = JSON.parse jsonStudent
  end

end
