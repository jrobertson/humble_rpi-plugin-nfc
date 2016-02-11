#!/usr/bin/env ruby

# file: humble_rpi-plugin-nfc.rb

require 'ruby-nfc'


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
    
    @readers[0].poll(Mifare::Classic::Tag, IsoDep::Tag, Mifare::Ultralight::Tag) do |tag|
      
      begin

        tag_id = @hashing ? tag.hash : tag
        notifier.notice "%s/nfc: detected %s" % [device_id, tag_id]

      rescue Exception => e
        p e
      end
      
    end    
    
  end
  
  alias on_start start
  
  
end