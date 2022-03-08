# frozen_string_literal: true

module VivaWallet
  class Payment

    class << self

      def create(params = {}, access_token = nil)
        response = VivaWallet.request(:post, 'checkout/v2/orders', params, access_token)

        response
      end
    end
  end
end