require 'json/pure'
require 'browser'

class EventsController < ApplicationController
respond_to :html, :json
  def index
    browser = Browser.new(:ua => request.user_agent)
    @events = Event.all
    if browser.android? or browser.name == "Other"
      json = JSON.pretty_generate(@events.map {|i| i.attributes })
      
      render :text => json
    else
      respond_with @events
    end
  end

  def show
    @event = Event.find(params[:id])

    browser = Browser.new(:ua => request.user_agent)
    if browser.android? or browser.name == "Other"
      id = request.body.read
      @event = Event.find(id)
      json = JSON.pretty_generate(@event.attributes)
      
      render :text => json
    else
      id = params[:id]
      @event = Event.find(id)
    end
  end

  def new
    # @event = Event.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render :json=> @event }
    # end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  def create
    browser = Browser.new(:ua => request.user_agent)
    if browser.android? or browser.name == "Other"
      info = JSON.parse(request.body.read)

      date = info['time']
      parse_date = date.split("/")

      table_names = {
        "name"  => info['name'],
        "students" => "",
        "checked_in" => "",
        "time(1i)" => parse_date[2],
        "time(2i)" => parse_date[0],
        "time(3i)" => parse_date[1]
      }
      @event = Event.create!(table_names)
      respond_with @event
    else
      @event = Event.create!(params[:event])
      flash[:notice] = "#{@event.name} was successfully created."
      redirect_to events_path
    end
  end

  def update
    browser = Browser.new(:ua => request.user_agent)
    if browser.android? or browser.name == "Other"
      info = JSON.parse(request.body.read)

      id = info['id']
      date = info['time']
      parse_date = date.split("/")

      table_names = {
        "name"  => info['name'],
        "students" => info['students'],
        "checked_in" => info['checked_in'],
        "time(1i)" => parse_date[2],
        "time(2i)" => parse_date[0],
        "time(3i)" => parse_date[1]
      }
      @event = Event.find(id)
      @event.update_attributes!(table_names)
      respond_with @event
    else
      @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice=> 'Event was successfully updated.' }
      else
        format.html { render :action=> "edit" }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
end
