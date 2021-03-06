class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.titles << Title.find_or_create_by(params[:title])

  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.save

    redirect :"/figures/#{@figure.id}"
  end

end
