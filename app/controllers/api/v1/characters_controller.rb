class Api::V1::CharactersController < ApplicationController
  def index
    characters = Character.all
    render json: { characters: characters }
  end
end
