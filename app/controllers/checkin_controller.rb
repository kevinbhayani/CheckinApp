#checkin_controller
require 'json'
require 'browser'

class CheckinController < ApplicationController
respond_to :html, :json
  
  def index
    @students = Student.all
    @events = Event.all
    @selected_id=0
    
    respond_with @students 
  end

  def create
    @students = Student.all
    @events = Event.all
    @student = Student.find params[:student_id]
    @event = Event.find params[:event_id]

    begin
      StudentsEvent.create!({"student_id" => params[:student_id], "event_id" => params[:event_id]})
    rescue
      flash[:notice] = "Error: Student '#{@student.name}' is already Checked In at Event '#{@event.name}'."
    else                              
      flash[:notice] = "Student '#{@student.name}' Checked In at Event '#{@event.name}'."
    end
    
    render 'index'
  end
end