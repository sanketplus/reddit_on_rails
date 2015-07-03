class LinksController < ApplicationController
	before_filter :authenticate_user!, :only => [:create]

	def show
		@link = Link.find(params[:id])
		@comment = Comment.new
	end

	def new
		@link = Link.new
	end

	def create
		@link = current_user.links.create(link_params)

		respond_to do |format|
			if @link.save
				format.html {render :action => "create"}
				format.json {render :json => @product}
			else
				format.html {render :action => "new"}
				format.json {render :json => @product.errors,:status => :unprocessable_entity}
			end
		end
	end

	def link_params
    	params.require(:link).permit(:title, :url)
  	end
	

end