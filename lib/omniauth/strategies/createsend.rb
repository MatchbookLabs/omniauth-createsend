require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class CreateSend < OmniAuth::Strategies::OAuth2
      option :name, "createsend"
      option :client_options, {
        :site => "https://api.createsend.com",
        :authorize_url => "/oauth",
        :token_url => "/oauth/token"
      }

      # Fixes regression in omniauth-oauth2 v1.4.0 by https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
      #
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization "createsend", "CreateSend"
