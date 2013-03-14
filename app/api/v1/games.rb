module Quoridor
  class API < Grape::API
    resources :game do

      helpers do

      end

      post :start do
        if params[:players]
          error! "Games are only for 2 or 4 players", 406 if params[:players] != "2" and params[:players] != "4"
          game = Game.create!(:players => params[:players])
        else
          game = Game.create!
        end

        move = Move.new(:player_id => 0, :act => 'joined')
        move.game = game
        move.save!

        present game
      end

      segment '/:id' do

        post :join do
          game = Game.find(params[:id])
          error! "No more players can join this game!", 406 if game.joined >= game.players

          player_id = game.joined+1

          if game.update_attribute(:joined, player_id)

            move = Move.new(:player_id => player_id, :act => 'joined')
            move.game = game
            move.save!

            if player_id == game.players
              move = Move.new(:player_id => 0, :act => 'start')
              move.game = game
              move.save!
            end

          else
            error! "User couldn't be added to the game, try later", 500
          end

          present player_id
        end

        get :moves do
          Move.find_all_by_game_id(params[:id], :order => "created_at")
        end

        post :move do

          error! "player_id must be defined", 406                     if !params[:player_id]
          error! "act must be defined", 406                           if !params[:act]
          error! "posx must be defined", 406                          if !params[:posx]
          error! "posy must be defined", 406                          if !params[:posy]
          error! "#{params[:act]} is not a valid move", 406           if params[:act] != "wall" and params[:act] != "move"
          error! "align must be defined when act is 'wall'", 406      if params[:act] == "wall" and !params[:align]
          error! "#{params[:align]}is not valid. Use 'v' or 'h'", 406 if params[:align] != "v" and params[:align] != "h"

          game = Game.find(params[:id])
          last_move = game.moves.last

          if last_move.act == 'start'
            error! "It's not your turn to play!", 403 if params[:player_id].to_s != last_move.player_id.to_s
          else
            error! "It's not your turn to play!", 403 if params[:player_id].to_s != ((last_move.player_id + 1) % 5).to_s
          end

          move = Move.new(
            :player_id => params[:player_id],
            :act => params[:act],
            :posx => params[:posx],
            :posy => params[:posy],
            :align => params[:align]
          )
          move.game = game
          move.save!

          present move
        end

      end

    end
  end
end
