class AirportsController < ApplicationController
   def index
      @new_airport = Airport.new
      @airports = Airport.all
   end
end
