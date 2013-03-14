module Quoridor
  class API < Grape::API
    resources :games do

      helpers do

      end

      post :start do
        present 'Calling "start"... WIP'
      end

      segment '/:id' do

        post :join do
          present 'Calling "join"... WIP'
        end

        get :moves do
          present 'Calling "moves"... WIP'
        end

        post :move do
          present 'Calling "move"... WIP'
        end

      end

    end
  end
end
