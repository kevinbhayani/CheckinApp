require 'json/pure'
require 'browser'

class StudentsController < ApplicationController
respond_to :html, :json
  
  def index
    browser = Browser.new(:ua => request.user_agent)
    @students = Student.all({:order => params[:sort]}) 
    if browser.android? or browser.name == "Other"
      json = JSON.pretty_generate(@students.map {|i| i.attributes })
      
      render :text => json
      #respond_with json  
    else
      respond_with @students
    end    
  end

  def show
    browser = Browser.new(:ua => request.user_agent)
       if browser.android? or browser.name == "Other"
      id = request.body.read
      @student = Student.find(id)
      json = JSON.pretty_generate(@student.attributes)
      
      render :text => json
      #respond_with json      
    else
      id = params[:id]
      @student = Student.find(id)
    end    
  end

  def new
    #default: render 'new' template
  end

  def create
    #Check user agent for android
    #logger.debug request.user_agent

    browser = Browser.new(:ua => request.user_agent)
    if browser.android? or browser.name == "Other"
      student_info = JSON.parse(request.body.read)
      #Need to optimize this
      #Will have to change json key names or database table names
      date = student_info['birthday']

      parse_date = date.split("/")

      table_names = {
        "name"  => student_info['namefirst']+" "+student_info['namelast'],
        "grade" => student_info['grade'],
        "notes" => student_info['notes'],
        "contactName" => student_info['contact']['name'],
        "contactPhone" => student_info['contact']['phone'], 
        "parentName"   => student_info['parents'][0]['name'] ,
        "parentPhone"   => student_info['parents'][0]['phone'] ,
        "parentAddress"   => student_info['parents'][0]['address'] ,
        "birthdate(1i)" => parse_date[2],
        "birthdate(2i)" => parse_date[0],
        "birthdate(3i)" => parse_date[1]
      }
      @student = Student.create!(table_names)
      respond_with @student
    else
      @student = Student.create!(params[:student])
      flash[:notice] = "#{@student.name} was successfully created."
      redirect_to students_path
    end
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
    render :text => jsonArray
  end

  def newStudent
  end

end
