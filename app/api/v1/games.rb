module Quoridor
  class API < Grape::API
    resources :game do

      helpers do

      end

      post :start do
        present 'Calling "start"... WIP', 200
      end

      segment '/:id' do

        post :join do
          present 'Calling "join"... WIP', 200
        end

        get :moves do
          present 'Calling "moves"... WIP', 200
        end

        post :move do
          present 'Calling "move"... WIP', 200
        end

      end

    end
  end
end
