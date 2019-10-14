class BuildsController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
        @builds = Build.where :project_id => @project
    end

    def build
        project = Project.find(params[:project_id])
        tmp_dir = File.join Rails.root.to_s, "tmp", project.id.to_s
        clone_path = File.join tmp_dir, project.name.gsub(" ", "")
        script_path = File.join tmp_dir, "_buildserver_script_#{project.id.to_s}.sh"
        FileUtils.rm_rf tmp_dir
        FileUtils.mkdir_p clone_path
        Dir.chdir tmp_dir
        output = `git clone #{project.git_clone_url} #{clone_path} 2>&1`
        if $?.success?
            File.write script_path, project.script
            Dir.chdir clone_path
            output = `sh -x #{script_path} 2>&1`
        else
            raise "Git clone failed: #{output}"
        end
        success = $?.success?
        FileUtils.rm_rf tmp_dir
        Dir.chdir Rails.root
        build = Build.create! :project_id => project.id, :success => success, :output => output
        redirect_to project_builds_path
    end
end
