#checkin_controller
require 'json'
require 'browser'

class CheckinController < ApplicationController
respond_to :html, :json
  
  def index
      @admin_template = false
      @studentsEvents = StudentsEvent.all.select{|u| u.checkin_status == true}
      # @studentsEvents.collect{|u| u["student_name"] = Student.find(u.student_id).name}
      # @studentsEvents = StudentsEvent.all
      @students = Student.all
      @events = Event.all
      @selected_id=0
      
      respond_with @studentsEvents     
  end

  def create
      # browser = Browser.new(:ua => request.user_agent)
      @students = Student.all
      @events = Event.all
      # @studentsEvents = StudentsEvent.all.select{|u| u.checkin_status == true}
      # @studentsEvents.collect{|u| u["student_name"] = Student.find(u.student_id).name}

      if browser.name == "Other"
        
        checkin_info = JSON.parse(request.body.read)
          
        if checkin_info['checkin_status'].eql? true
          @checkin = StudentsEvent.create!(checkin_info)
          #@checkin["student_name"] = Student.find(checkin_info['student_id']).name
          render :json => @checkin
      
        elsif checkin_info['checkin_status'].eql? false
          @checkout = StudentsEvent.find checkin_info['checkout_id']
          @checkout.checkin_status = false
          @checkout.save
          render :json => @checkout 
        end
        
      else        
        
        if not params[:checkout].nil?
          @change = StudentsEvent.find params[:checkout]
          @change.checkin_status = false
          @change.save
        
        else
          redirect_to checkin_index_path and show_error_message and return if params[:student_id].eql? "0" or params[:event_id].eql? "0"
          @student = Student.find params[:student_id]
          @event = Event.find params[:event_id]
  
          begin
            StudentsEvent.create!({"student_id" => params[:student_id], "event_id" => params[:event_id]})
          rescue
            flash[:notice] = "Error: Student '#{@student.name}' is already Checked In at Event '#{@event.name}'."
          else                              
            flash[:notice] = "Student '#{@student.name}' Checked In at Event '#{@event.name}'."
          end
        end       
        redirect_to checkin_index_path              
      end
  end
 
  def show_error_message
    flash[:notice] = "Error: Select valid Student and Event"
  end

  def new
    @admin_template = false
  end
  
  def addStudent
    @student = Student.create!(params[:student])
    flash[:notice] = "#{@student.name} was successfully created."
    redirect_to checkin_index_path
  end
end
