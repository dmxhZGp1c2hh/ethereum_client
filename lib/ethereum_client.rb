require 'json'
require 'httparty'

# Ethereum JSON RPC client
module EthereumClient
  class << self
    def web3_client_version
      payload = {
        method: 'web3_clientVersion'
      }

      post(payload)
    end

    private

    def post(payload)
      body = payload.to_json
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }

      response = HTTParty.post(url, body: body, headers: headers)

      JSON.parse(response.body)['result']
    end

    def url
      'http://localhost:8545'
    end
  end
end
