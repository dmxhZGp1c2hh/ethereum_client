require 'spec_helper'
require 'ethereum_client'

RSpec.describe EthereumClient do
  subject { EthereumClient }

  describe '.web3_client_version' do
    let(:web3_client_version) { 'Geth/v1.3.6-9e323d65/linux/go1.6' }

    let(:request_body) do
      {
        method: 'web3_clientVersion'
      }.to_json
    end

    let(:response_body) do
      {
        id: nil,
        jsonrpc: '',
        result: web3_client_version
      }.to_json
    end

    before do
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }

      stub_request(:post, 'http://localhost:8545')
        .with(body: request_body, headers: headers)
        .to_return(status: 200, body: response_body)
    end

    it 'makes proper json rpc request' do
      expect(subject.web3_client_version).to eq(web3_client_version)
    end
  end
end
