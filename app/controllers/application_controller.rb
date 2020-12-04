class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do
    redirect "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index 
  end

  get '/recipes/new' do
    erb :"recipes/new"
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  put '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    params.delete("_method")
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end

end
