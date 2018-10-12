class LandmarksController < ApplicationController
  set :views, "app/views/landmarks"

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    name = params[:landmark][:name]
    year_completed = params[:landmark][:year_completed]

    landmark = Landmark.create(name: name, year_completed: year_completed)

    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    name = params[:landmark][:name]
    year_completed = params[:landmark][:year_completed]

    @landmark.update_attributes(name: name, year_completed: year_completed)

    redirect "/landmarks/#{@landmark.id}"
  end

end
