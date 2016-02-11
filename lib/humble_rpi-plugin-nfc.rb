#!/usr/bin/env ruby

# file: humble_rpi-plugin-nfc.rb

require 'ruby-nfc'
require 'digest/md5'


class HumbleRPiPluginNFC
  

  def initialize(settings: {}, variables: {})

    @notifier = variables[:notifier]
    @device_id = variables[:device_id] || 'pi'
    @readers = NFC::Reader.all
    @hashing = settings[:hashing] || true

  end

  def start()
    
    notifier = @notifier
    device_id = @device_id
        
    puts 'ready to detect RFID tags'
    
    @readers[0].poll(Mifare::Classic::Tag, 
                     Mifare::Ultralight::Tag, IsoDep::Tag) do |tag|
      
      begin
        
        tag_id = @hashing ? (Digest::MD5.new << tag.to_s).to_s : tag
        notifier.notice "%s/nfc: detected %s" % [device_id, tag_id]

      rescue Exception => e
        p e
      end
      
    end    
    
  end
  
  alias on_start start
  
  
end