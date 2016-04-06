require 'spec_helper'
require 'ethereum_client'

RSpec.describe EthereumClient do
  subject { EthereumClient }

  describe '.web3_client_version' do
    context 'method not implemented' do
      let(:error_class) { EthereumClient::Error }
      let(:error_message) { 'web3_clientVersion method not implemented' }

      it 'raises error with a message' do
        expect(subject).to receive(:post)
          .once
          .and_raise(error_class, error_message)

        expect { subject.web3_client_version }.to raise_error(
          error_class,
          error_message
        )
      end
    end

    context 'api working properly' do
      let(:client_version) { 'Geth/v1.3.6/linux/go1.5.1' }

      it 'returns client version' do
        expect(subject).to receive(:post).once.and_return(client_version)

        expect(subject.web3_client_version).to eq(client_version)
      end
    end
  end

  describe '.web3_sha3' do
    let(:string) { '0x68656c6c6f20776f726c64' }

    context 'method not implemented' do
      let(:error_class) { EthereumClient::Error }
      let(:error_message) { 'web3_sha3 method not implemented' }

      it 'raises error with a message' do
        expect(subject).to receive(:post)
          .once
          .and_raise(error_class, error_message)

        expect { subject.web3_sha3(string) }.to raise_error(
          error_class,
          error_message
        )
      end
    end

    context 'api working properly' do
      let(:sha3) { '0x47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad' }

      it 'returns string' do
        expect(subject).to receive(:post).once.and_return(sha3)

        expect(subject.web3_sha3(string)).to eq(sha3)
      end
    end
  end
end
