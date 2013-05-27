class TeamsController < ApplicationController
	def new
		@team = Team.new

		respond_to do |format|
			format.html
		end
	end

	def create
		@team = Team.new(params[:team])
		@team.users << current_user
		error = false
		current_user.teams.each do |t|
			if t.name == @team.name
				error = true
				break			
			end
		end
		respond_to do |format|
			if error
				format.html{ redirect_to '/'+@team.name, alert: 'Team with name already exists.'}
			elsif @team.save
				current_user.teams << @team
				format.html{redirect_to '/' + @team.name, notice: 'Team was successfully created.' }
			else
				format.html {render action: "new"}
			end
		end
	end

	def show
		@team = current_user.teams.find_by_name(params[:teamName])
		respond_to do |format|
	    	format.html # show.html.erb
	  	end
	end

	def getUsers
		@users = User.where("email like ?", "%#{params[:q]}%")
		respond_to do |format|
	    	format.html # show.html.erb
	    	format.json { render :json => @users.map(&:attributes), :only => ["id", "email"] }
	  	end
	end
end
