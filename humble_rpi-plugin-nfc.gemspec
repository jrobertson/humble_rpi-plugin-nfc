Gem::Specification.new do |s|
  s.name = 'humble_rpi-plugin-nfc'
  s.version = '0.1.2'
  s.summary = 'A humble_rpi plugin for reading NFC RFID tags (using the ruby-nfc gem) and publishing the identifier to the messaging broker'
  s.authors = ['James Robertson']
  s.files = Dir['lib/humble_rpi-plugin-nfc.rb']
  s.add_runtime_dependency('ruby-nfc', '~> 1.3', '>=1.3')
  s.signing_key = '../privatekeys/humble_rpi-plugin-nfc.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/humble_rpi-plugin-nfc'
end
