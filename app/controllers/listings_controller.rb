class ListingsController < ApplicationController
	def index
		@listings = Listing.search(params[:search],params[:lat],params[:lng])
		@hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
			if !listing.name.nil?
				marker.lat listing.latitude
				marker.lng listing.longitude
				marker.title listing.name
  				# marker.infowindow listing.name + "<br>" + listing.address + " " + listing.city
  			end
  		end
  	end
  	def show
  		@listing = Listing.find(params[:id])
  		@tags = @listing.tags
      @tag_options = Tag.all
      @tagging = Tagging.new
  		markers = [@listing]
  		@hash = Gmaps4rails.build_markers(markers) do |listing, marker|
  			marker.lat listing.latitude
  			marker.lng listing.longitude
  			marker.title listing.name
  			marker.infowindow listing.name + "<br>" + listing.address + " " + listing.city
  		end
  	end

  	def new
  		@listing = Listing.new
  	end
  	def create
  		@listing = Listing.new(listing_params)
  		@listing.latitude = 0
  		@listing.longitude = 0	
  		if @listing.save
  			redirect_to '/'
  		else
  			render 'new'
  		end
  	end

  	def edit
  		@listing = Listing.find(params[:id])
  	end

  	def update
  		@listing = Listing.find(params[:id])
  		if @listing.update_attributes(listing_params)
  			redirect_to(:action => 'show', :id => @listing.id)
  		else
  			render('index')
  		end
  	end

  	def destroy
  		@listing = Listing.find(params[:id])
  		if @listing.delete
  			redirect_to(:action => 'index')
  		else 
  			flash[:error] = "Listing deletion failed!"
  			redirect_to(:action => 'index')
  		end
  	end

  	private
  	def listing_params
  		params.require(:listing).permit(:name,:address,:city,:state,:country,:postal_code,:website,:logo_url,:description)
  	end
  end
