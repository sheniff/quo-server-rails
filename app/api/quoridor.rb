module Quoridor
    class API < Grape::API
      version 'v1', using: :path
      default_format :json
      format :json

      helpers do
        # def warden
        #   env['warden']
        # end

        # def authenticate!
        #   if warden.authenticated?
        #     true
        #   elsif api_user || sandbox_user
        #     true
        #   else
        #     error!('401 Unauthorized', 401)
        #   end
        # end

        # def current_user
        #   warden.user || api_user || sandbox_user
        # end

        # def current_organization
        #   current_user.organization
        # end

        # def api_user
        #   @api_user ||= params[:api_key] && User.find_for_token_authentication(auth_token: params[:api_key])
        # end

        # # TODO: sandbox mode for prod?
        # def sandbox_user
        #   if params[:api_key] == 'sandbox' && Rails.env.development?
        #     @sandbox_user = User.first
        #   end
        # end
      end
    end

    Dir[File.dirname(__FILE__) + '/v1/*.rb'].each { |file| require(file) }
end
