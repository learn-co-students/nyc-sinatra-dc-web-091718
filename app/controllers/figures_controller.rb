class FiguresController < ApplicationController
  
  set :views, "app/views/figures"

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  post '/figures' do
    name = params[:figure][:name]
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    title_name = params[:title][:name]
    landmark_name = params[:landmark][:name]


    figure = Figure.create(name: name, title_ids: title_ids, landmark_ids: landmark_ids)
    new_title = figure.titles.create(name: title_name)
    new_landmark = figure.landmarks.create(name: landmark_name)

    redirect '/figures'
  end

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :show
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :edit
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    name = params[:figure][:name]
    title_ids = params[:figure][:title_ids]
    landmark_ids = params[:figure][:landmark_ids]
    title_name = params[:title][:name]
    landmark_name = params[:landmark][:name]

    @figure.update(name: name, title_ids: title_ids, landmark_ids: landmark_ids)
    new_title = @figure.titles.create(name: title_name)
    new_landmark = @figure.landmarks.create(name: landmark_name)

    redirect "/figures/#{ @figure.id }"
  end

end
