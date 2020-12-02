require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/icecreams" do
    @icecreams = IceCream.all
    erb :"icecreams/index"
  end

  get "/icecreams/new" do
    erb :"icecreams/new"
  end

  post "/icecreams" do
    IceCream.create(params)
    redirect "/icecreams"
  end

end
