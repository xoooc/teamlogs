class TeamsController < ApplicationController
	def new
		@team = Team.new

		respond_to do |format|
			format.html
		end
	end

	def create
		@team = Team.new(params[:team])
		#@team.users << current_user
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
		10.times{puts @team.name}
		respond_to do |format|
	    	format.html # show.html.erb
	    end
	end

	def getUsers
		@users = User.where("email like ?", "%#{params[:q]}%")
		respond_to do |format|
	    	format.html # show.html.erb
	    	format.json { render :json => @users.map(&:attributes) }
	    end
	end

	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(params[:team])
			render :action => 'show',
			:notice  => "Successfully updated team."
		else
			render :action => 'edit'
		end
	end

	def addMembers
		@team = Team.find(params[:id])
		if @team.users << User.find(params[:user])
			render :action => 'show'
		end
	end
end
