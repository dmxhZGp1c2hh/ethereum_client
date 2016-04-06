Gem::Specification.new do |s|
  s.name        = 'ethereum_client'
  s.version     = '0.0.2'
  s.license     = 'MIT'
  s.summary     = 'Ethereum JSON RPC client'
  s.description = 'Simple ruby wrapper around Ethereum JSON RPC API'
  s.author      = 'Vlad D'
  s.email       = 'dmxhZGp1c2hh@yandex.ru'
  s.files       = Dir['lib/**/*.rb'] + Dir['spec/*.rb']
  s.homepage    = 'https://github.com/dmxhZGp1c2hh/ethereum_client'

  s.add_runtime_dependency 'httparty', '~> 0.13.7'

  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'webmock', '~> 1.24'
end
