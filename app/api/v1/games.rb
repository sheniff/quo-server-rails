class QuoAPI < Grape::API
  resources :games do

    helpers do

    end

    post :start do

    end

    segment '/:id' do

      post :join do

      end

      get :moves do

      end

      post :move do

      end

    end

  end
end
