class MembersController < ApplicationController
	def index
		@users = User.where("username like ?", "%#{params[:q]}%")
		respond_to do |format|
	    	format.html # show.html.erb
	    	format.json { render :json => @users.map{|f| {:id => f.id, :username => f.username} }}
	    end
	end
end
