class TeamsController < ApplicationController
	def new
		@team = Team.new

		respond_to do |format|
			format.html
		end
	end

	def create
		@team = Team.new(params[:team])
		respond_to do |format|
			if @team.save
				current_user.teams << @team
				format.html{redirect_to @team, notice: 'Team was successfully created.' }
			else
				format.html {render action: "new" }
			end
		end
	end

	def show
	    @team = Team.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @log }
	    end
  	end

end
