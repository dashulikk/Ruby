class BaggagesController < ApplicationController
   def index
      @planes = Plane.all
   end

   def new
      @new_baggage = Baggage.new
      @new_baggage.plane_id = params[:id]
      puts "Creating a new baggage for plane (id) " + @new_baggage.plane_id.to_s
   end

   def create
      @baggage = Baggage.new(baggage_params)
      @baggage.plane_id = params[:id]
      puts "Saving new baggage for plane (id) " + @baggage.plane_id.to_s
      if @baggage.count < 1000 && @baggage.count >= 1 && @baggage.weight > 0 && @baggage.save
         redirect_to baggages_path
      else
         redirect_back fallback_location: root_path
      end
   end

   def edit
      @baggage = Baggage.find(params[:id])
   end

   def update
      @baggage = Baggage.find(params[:id])
      w = params[:baggage][:weight].to_f
      c = params[:baggage][:count].to_i
      if c > 0 && c < 1000 && w > 0 && @baggage.update(weight: w, count: c)
         redirect_to planes_path
      else
         redirect_back fallback_location: root_path
      end
   end

   def destroy
      Baggage.destroy(params[:id])
      redirect_to planes_path
   end

   private
   def baggage_params
      params.require(:baggage).permit(:weight, :count)
   end
end
