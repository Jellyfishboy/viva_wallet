# frozen_string_literal: true

module VivaWallet
  class Authentication

    class << self
      def oauth
        RestClient::Request.new({
                                  method: :post,
                                  url: VivaWallet.account_api_base + 'connect/token?grant_type=client_credentials',
                                  headers: {
                                    accept: :json,
                                    content_type: :json,
                                    'Authorization': "Bearer #{VivaWallet.client_base64}"
                                  }
                                }).execute do |response, request, result|
          str_response = response.to_str
          str_response.blank? ? '' : JSON.parse(str_response)
        end
      end
    end
  end
end
