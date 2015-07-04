class VotesController < ApplicationController
	before_filter :authenticate_user!, :only => [:create]

	def show
	end

	def new
		@vote = Vote.new
	end

	def create
		@vote = current_user.votes.where(:link_id => vote_params[:link_id]).first || current_user.votes.create(vote_params)
		@vote.update_attributes(vote_params)
		#puts "======================"
  		#puts @vote.errors.inspect
  		#puts @vote.inspect
  		#puts vote_params[:link_id]
		redirect_to :back
	end

	def vote_params
    	params.require(:vote).permit(:link_id, :up)
  	end
	
end