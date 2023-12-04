class PlanesController < ApplicationController
   protect_from_forgery with: :null_session

   def index
      @planes = Plane.all
   end

   def show
      @plane = Plane.find(params[:id])
   end

   def new
      @new_plane = Plane.new
      @models = AvailableModel.all
      @pilots = AvailablePilot.all
      b = true
      @pilots.each do |p|
         b = false
      end
      if b
         redirect_to pilots_path
      end
      @airports = Airport.all
   end

   def create
      airport_ids = params[:name][:id]
      model_name = params[:airport][:model]
      pilot_id = params[:airport][:pilot]

      puts "###################################"
      puts "###################################"
      puts "###################################"
      puts airport_ids, model_name, pilot_id
      puts "###################################"
      puts "###################################"
      puts "###################################"

      @plane = AvailableModel.find_by_model(model_name)
      @pilot = AvailablePilot.find(pilot_id)

      # create and save new plane
      @new_plane = Plane.new(model: @plane.model, image: @plane.image)
      @new_plane.save

      # create new pilot and mark it as unavailable
      @new_pilot = Pilot.new(name: @pilot.name, image: @pilot.image, plane_id: @new_plane.id)
      @new_pilot.save
      AvailablePilot.destroy(@pilot.id)

      # create association between airports and plane
      1.upto airport_ids.length - 1 do |i|
         part = Part.new(plane_id: @new_plane.id, airport_id: airport_ids[i])
         part.save
      end

      redirect_to planes_path
   end

   def destroy
      id = params[:id].to_i
      Part.destroy_by(plane_id: id)
      Baggage.destroy_by(plane_id: id)

      @pilot = Pilot.find_by_plane_id(id)
      @new_pilot = AvailablePilot.new(name: @pilot.name, image: @pilot.image)
      @new_pilot.save
      Pilot.destroy(@pilot.id)

      Plane.destroy(id)

      redirect_to planes_path
   end
end
