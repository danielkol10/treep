class TripsController < ApplicationController
  def index
    # should be empty
    # or just use it as Dashboard, for "My Trips"
  end

  def new
    # this should be the first page after Home page
    # where the user Chooses the tags/preferences
    # then he clicks "Create/Generate Trip"
  end

  def create
    # POST request most work with the API..
    # ALL THE IMPORTANT WORK
    # how to translate users answers on preferences to API tags...
  end

  def show
    # we can use it when you click on one of the trips in "My trips" list
    # to see the past/current trips details
    # which is the same as the edit page but without option to edit
    # connected to Index / Dashboard / "My trips"
  end

  def edit
    # Baraa - I think this should be the page where the user can
    # choose and change between difference venues/events to finalize
    # the trip
    # Also to give access to this page again from "My Trips" - edit?
    # here the user is actually updating/deleting venues or events.
  end

  def update
    # POST request - finalize the trip and save the changes
    # Also to give access to this page again from "My Trips" - edit?
  end

  def delete
    # we can add this button in the "My trips" Dashboard.
  end
end
