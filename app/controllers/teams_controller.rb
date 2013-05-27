class TeamsController < ApplicationController
	def new
		@team = Team.new

		respond_to do |format|
			format.html
		end
	end

	def create
		@team = Team.new(params[:team])
		error = false
		current_user.teams.each do |t|
			if t.name = @team.name
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
		@team = Team.find_by_name(params[:teamName])
		respond_to do |format|
	      format.html # show.html.erb
	  end
	end
end
