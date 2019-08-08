require './environment'

module FormsLab
  class App < Sinatra::Base
  #incase app cant read specifc view folders:
  # set :views , Proc.new {File.join(root, "./views/#{folder_name}")}

    set :views , Proc.new {File.join(root, "./views/pirates")}

    # code other routes/actions here
    get '/' do
      "Welcome to the Nested Forms Lab!"
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :show
    end

  end
end
