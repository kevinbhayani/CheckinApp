class VolunteersController < ApplicationController
  def index
      @volunteers = Volunteer.all
  end

  def show
    id = params[:id]
    @volunteer = Volunteer.find(id)
  end

  def new
    #default: render 'new' template
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    
    respond_to do |format|
      if @volunteer.update_attributes(params[:volunteer])
        format.html { redirect_to(volunteers_path, :notice => "Volunteer #{@volunteer.name} was successfully updated.") }
      else
        format.html { redirect_to(volunteers_path, :notice => "Update failed.") }
      end
    end
  end

  def create
    @volunteer = Volunteer.create!(params[:volunteer])
    flash[:notice] = "#{@volunteer.name} was successfully created."
    redirect_to volunteers_path
  end

  def edit
    @volunteer = Volunteer.find params[:id]
  end

  def destroy
    @volunteer = Volunteer.find params[:id]
    @volunteer.destroy
    redirect_to volunteers_path
    flash[:notice] = "Volunteer '#{@volunteer.name}' deleted."
  end
end
