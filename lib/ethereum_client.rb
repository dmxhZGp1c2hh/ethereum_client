require 'json'
require 'httparty'
require 'ethereum_client/error'

# Ethereum JSON RPC client
module EthereumClient
  class << self
    HEADERS = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }.freeze

    def web3_client_version
      payload = {
        method: 'web3_clientVersion'
      }

      post(payload)
    end

    def web3_sha3(string)
      payload = {
        method: 'web3_sha3',
        params: [string]
      }

      post(payload)
    end

    private

    def post(payload)
      body = payload.to_json

      response = HTTParty.post(url, body: body, headers: HEADERS)

      json = JSON.parse(response.body)

      if json.key?('error')
        raise EthereumClient::Error, json['error']['message']
      end

      json['result']
    end

    def url
      'http://localhost:8545'
    end
  end
end
