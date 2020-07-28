class Api::V1::DecksController < ApplicationController
  
  def create
    deck = Deck.new # create a new instance of a deck
    user = User.find(session[:user_id]) # get the current logged in user 
    deck.name = deck_params[:name] # set the name of the deck
    deck.user = user # set the user of the deck
    
    if deck.save # save the deck
      cards = deck_params[:selectedCards] # get the card ids
      cardsIdArray = cards.map { |card| card[:id] } # get the card ids
      queriedCards = Card.where(id: cardsIdArray) # query for all the cards that belong to this deck
      deck.cards = queriedCards # save all the cards in the deck
      render(json: { id: deck.id })
    else
      render(json: { message: 'could not create deck', errors: deck.errors.full_messages, status: 422 }, status: 422)
    end
  end

  def show
    d = Deck.find params[:id]

    deck = {
      id: d.id,
      name: d.name,
      cards: d.cards
    }

    render(json: deck)
  end

  def update
    deck = Deck.find params[:id]
    cards = deck_params[:selectedCards]

    queriedCards = cards.map { |card|
      # Card.where ( id: card[:id])
      Card.find(card[:id])
    }

    updated_params = {
      name: deck_params[:name],
      cards: queriedCards
    }

    # if deck.update updated_params
      render(json: { message: 'deck updated', id: deck.id})
    # else
    #   render(json: { message: 'it failed to update Deck', errors: deck.errors.full_messages, status: 422}, status: 422)
    # end
  
  end

  private

  def deck_params
    params.require(:deck).permit(:name, selectedCards: [:id, :card_id, :name, :description, :thumbnail_url, :durability, :energy, :fighting_skills, :intelligence, :speed, :strength, :created_at, :updated_at])
  end

end
