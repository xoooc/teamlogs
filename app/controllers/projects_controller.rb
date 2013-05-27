class ProjectsController < ApplicationController
	def new
		@project = Project.new
		session[:current_team_name] = params[:teamName]
		respond_to do |format|
			format.html
		end
	end

	def create
		@project = Project.new(params[:project])
		respond_to do |format|
			if @project.save
				Team.find_by_name(session[:current_team_name]).projects << @project
				format.html{redirect_to '/' + session[:current_team_name] + '/' + @project.name, notice: 'Project was successfully created.' }
			else
				format.html {render action: "new" }
			end
		end
	end

	def show
	    @project = Team.find_by_name(params[:teamName]).projects.find_by_name(params[:projectName])
	    respond_to do |format|
	      format.html # show.html.erb
	    end
  	end
end
