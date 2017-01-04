class PinsController < ApplicationController

	def index
		@pins = Pin.all.order("created_at DESC")
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		if @pin.save
			redirect_to pin_path(@pin), notice: "Sucessfully created"
		else
			render action: "new"
		end
	end
    
    def show
    	@pin = Pin.find(params[:id])
    end

    def edit
    	@pin = Pin.find(parms[:id])
    end

    def update
    	@pin = Pin.find(params[:id])
    	@pin.update_attributes(pin_params)
    	if @pin.save
    		redirect_to pin_path(@pin), notice: "Sucessfully Created"
    	else
    		render action: "new"
    	end
    end

    def destroy
    	@pin = Pin.find(params[:id])
    	@pin.destroy
    	redirect_to pin_path(@pin), notice: "Succesfully Created"
    end
   



private

def pin_params
	params[:pin].permit(:title,:description)
end

end
