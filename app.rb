require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do 
      @pirate = params[:pirate]
      Pirate.new(@pirate[:name],@pirate[:weight],@pirate[:height])
      @ships = params[:pirate][:ships]
      @ships.each do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end

      erb :"pirates/show"
    end

  end
end
