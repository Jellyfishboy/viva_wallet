# frozen_string_literal: true

require 'rest-client'
require 'base64'

require_relative "viva_wallet/version"
require_relative 'viva_wallet/authentication'
require_relative 'viva_wallet/payment'

module VivaWallet

  class VivaWalletError < StandardError; end

  class ConfigurationError < VivaWalletError; end

  class << self
    attr_writer :client_id, :client_secret, :test_mode, :api_base, :account_api_base, :client_base64

    def client_id
      defined? @client_id and @client_id or raise(
        ConfigurationError, "VivaWallet client_id not configured"
      )
    end

    def client_secret
      defined? @client_secret and @client_secret or raise(
        ConfigurationError, "VivaWallet client_secret not configured"
      )
    end

    def test_mode
      @test_mode.nil? ? false : @test_mode
    end

    def api_base
      VivaWallet.test_mode ? "https://demo-api.vivapayments.com/" : "https://api.vivapayments.com/"
    end

    def account_api_base
      VivaWallet.test_mode ? "https://demo-accounts.vivapayments.com/" : "https://accounts.vivapayments.com/"
    end

    def client_base64
      Base64.encode64("#{VivaWallet.client_id}:#{VivaWallet.client_secret}")
    end

    def request(method, resource, params = {}, access_token = nil)
      access_token = access_token

      params.except!(:access_token)

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )

      if method == :get
        url = VivaWallet.api_base + resource + '?' + params
        headers = {
          accept: :json,
          content_type: :json,
          'Authorization': "Bearer #{access_token}"
        }.merge({ params: params })
        payload = nil
      else
        url = VivaWallet.api_base + resource
        headers = {
          accept: :json,
          content_type: :json,
          'Authorization': "Bearer #{access_token}"
        }
        payload = params
      end
      RestClient::Request.new({
                                method: method,
                                url: url,
                                payload: payload.to_json,
                                headers: headers
                              }).execute do |response, request, result|
        str_response = response.to_str
        str_response.blank? ? '' : JSON.parse(str_response)
      end
    end
  end
end
