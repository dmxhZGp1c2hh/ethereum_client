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

    # Returns the current client version.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion
    def web3_client_version
      payload = {
        method: 'web3_clientVersion'
      }

      post(payload)
    end

    # Returns Keccak-256 (not the standardized SHA3-256) of the given data.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3
    def web3_sha3(string)
      payload = {
        method: 'web3_sha3',
        params: [string]
      }

      post(payload)
    end

    # Returns the current network protocol version.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version
    def net_version
      raise NotImplementedError, 'net_version not yet implemented'
    end

    # Returns true if client is actively listening for network connections.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening
    def net_listening
      raise NotImplementedError, 'net_listening not yet implemented'
    end

    # Returns number of peers currenly connected to the client.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount
    def net_peer_count
      raise NotImplementedError, 'net_peer_count not yet implemented'
    end

    # Returns the current ethereum protocol version.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion
    def eth_protocol_version
      raise NotImplementedError, 'eth_protocol_version not yet implemented'
    end

    # Returns an object with data about the sync status or +false+.
    #
    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing
    def eth_syncing
      raise NotImplementedError, 'eth_syncing not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase
    def eth_coinbase
      raise NotImplementedError, 'eth_coinbase not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining
    def eth_mining
      raise NotImplementedError, 'eth_mining not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate
    def eth_hashrate
      raise NotImplementedError, 'eth_hashrate not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice
    def eth_gas_price
      raise NotImplementedError, 'eth_gas_price not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts
    def eth_accounts
      raise NotImplementedError, 'eth_accounts not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber
    def eth_block_number
      raise NotImplementedError, 'eth_block_number not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance
    def eth_get_balance(address, block_number)
      raise NotImplementedError, 'eth_get_balance not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat
    def eth_get_storage_at(address, position, block_number)
      raise NotImplementedError, 'eth_get_storage_at not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount
    def eth_get_transaction_count(address, block_number)
      raise NotImplementedError, 'eth_get_transaction_count not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbyhash
    def eth_get_block_transaction_count_by_hash(block_hash)
      raise NotImplementedError, 'eth_get_block_transaction_count_by_hash not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbynumber
    def eth_get_block_transaction_count_by_number(block_number)
      raise NotImplementedError, 'eth_get_block_transaction_count_by_number not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblockhash
    def eth_get_uncle_count_by_block_hash(block_hash)
      raise NotImplementedError, 'eth_get_uncle_count_by_block_hash not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblocknumber
    def eth_get_uncle_count_by_block_number(block_number)
      raise NotImplementedError, 'eth_get_uncle_count_by_block_number not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode
    def eth_get_code(address, block_number)
      raise NotImplementedError, 'eth_get_code not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign
    def eth_sign(address, data)
      raise NotImplementedError, 'eth_sign not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction
    def eth_send_transaction(object)
      raise NotImplementedError, 'eth_send_transaction not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction
    def eth_send_raw_transaction(signed_transaction_data)
      raise NotImplementedError, 'eth_send_raw_transaction not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call
    def eth_call(object)
      raise NotImplementedError, 'eth_call not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas
    def eth_estimate_gas(object)
      raise NotImplementedError, 'eth_estimate_gas not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbyhash
    def eth_get_block_by_hash(block_hash, full)
      raise NotImplementedError, 'eth_get_block_by_hash not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbynumber
    def eth_get_block_by_number(block_number, full)
      raise NotImplementedError, 'eth_get_block_by_number not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash
    def eth_get_transaction_by_hash(transaction_hash)
      raise NotImplementedError, 'eth_get_transaction_by_hash not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex
    def eth_get_transaction_by_block_hash_and_index(block_hash, transaction_index)
      raise NotImplementedError, 'eth_get_transaction_by_block_hash_and_index not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex
    def eth_get_transaction_by_block_number_and_index(block_number, transaction_index)
      raise NotImplementedError, 'eth_get_transaction_by_block_number_and_index not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionreceipt
    def eth_get_transaction_receipt(transaction_hash)
      raise NotImplementedError, 'eth_get_transaction_receipt not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblockhashandindex
    def eth_get_uncle_by_block_hash_and_index(block_hash, uncle_index)
      raise NotImplementedError, 'eth_get_uncle_by_block_hash_and_index not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblocknumberandindex
    def eth_get_uncle_by_block_number_and_index(block_number, uncle_index)
      raise NotImplementedError, 'eth_get_uncle_by_block_number_and_index not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers
    def eth_get_compilers
      raise NotImplementedError, 'eth_get_compilers not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilesolidity
    def eth_compile_solidity(code)
      raise NotImplementedError, 'eth_compile_solidity not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilelll
    def eth_compile_LLL(code)
      raise NotImplementedError, 'eth_compile_LLL not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileserpent
    def eth_compile_serpent(code)
      raise NotImplementedError, 'eth_compile_serpent not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter
    def eth_new_filter(object)
      raise NotImplementedError, 'eth_new_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newblockfilter
    def eth_new_block_filter
      raise NotImplementedError, 'eth_new_block_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newpendingtransactionfilter
    def eth_new_pending_transaction_filter
      raise NotImplementedError, 'eth_new_pending_transaction_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_uninstallfilter
    def eth_uninstall_filter(filter_id)
      raise NotImplementedError, 'eth_uninstall_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterchanges
    def eth_get_filter_changes(filter_id)
      raise NotImplementedError, 'eth_get_filter_changes not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterlogs
    def eth_get_filter_logs(filter_id)
      raise NotImplementedError, 'eth_get_filter_logs not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getlogs
    def eth_get_logs(filter)
      raise NotImplementedError, 'eth_get_logs not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork
    def eth_get_work
      raise NotImplementedError, 'eth_get_work not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork
    def eth_submit_work(nonce_found, headers_pow_hash, mix_digest)
      raise NotImplementedError, 'eth_submit_work not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submithashrate
    def eth_submit_hashrate(hashrate, random)
      raise NotImplementedError, 'eth_submit_hashrate not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_version
    def shh_version
      raise NotImplementedError, 'shh_version not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_post
    def shh_post(object)
      raise NotImplementedError, 'shh_post not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newidentity
    def shh_new_identity
      raise NotImplementedError, 'shh_new_identity not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_hasidentity
    def shh_has_identity(address)
      raise NotImplementedError, 'shh_has_identity not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newgroup
    def shh_new_group
      raise NotImplementedError, 'shh_new_group not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_addtogroup
    def shh_add_to_group(address)
      raise NotImplementedError, 'shh_add_to_group not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newfilter
    def shh_new_filter(object)
      raise NotImplementedError, 'shh_new_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_uninstallfilter
    def shh_uninstall_filter(filter_id)
      raise NotImplementedError, 'shh_uninstall_filter not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getfilterchanges
    def shh_get_filter_changes(filter_id)
      raise NotImplementedError, 'shh_get_filter_changes not yet implemented'
    end

    # https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getmessages
    def shh_get_messages(filter_id)
      raise NotImplementedError, 'shh_get_messages not yet implemented'
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
