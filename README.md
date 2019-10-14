# Buildserver

A sample Ruby on Rails app for a very basic build server

## Setup
```bash
rake db:setup
docker-compose up -d postgres
rails server
```

## Running

### Create a new project

Create a new project with the following params:

* Name: Buildserver
* Git clone URL: https://github.com/mchecca/buildserver.git
* Script: ls

Navigate to the project url: `http://127.0.0.1:3000/projects/1` and click "Build".
You should be redirected to the list of builds
