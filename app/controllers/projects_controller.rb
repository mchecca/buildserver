class ProjectsController < ApplicationController
    def new
    end

    def edit
        @project = Project.find(params[:id])
    end

    def index
        @projects = Project.all
    end

    def create
        params.permit!
        @project = Project.create(params[:project])
        redirect_to @project
    end

    def update
        params.permit!
        @project = Project.find(params[:id])
        @project.update(params[:project])
        redirect_to @project
    end

    def show
        @project = Project.find(params[:id])
    end
end
