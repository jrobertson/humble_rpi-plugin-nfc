# Introducing the Humble RPi plugin NFC gem


## Testing the plugin

    require 'humble_rpi-plugin-nfc'


    class Echo

      def notice(s)
        puts "%s: %s" % [Time.now, s]
      end
    end


    nfc = HumbleRPiPluginNFC.new(variables: {notifier: Echo.new})
    nfc.start

Output:

<pre>
ready to detect RFID tags
2016-02-09 00:46:37 +0000: pi/nfc: detected 9d424e7c Mifare Classic 1k SAK: 0x8
2016-02-09 00:47:04 +0000: pi/nfc: detected 9d424e7c Mifare Classic 1k SAK: 0x8
</pre>

## Running the plugin from the HumbleRPi gem

    require 'humble_rpi'
    require 'humble_rpi-plugin-nfc'

    r = HumbleRPi.new device_name: 'ottavia', sps_address: '192.168.4.140',\
      plugins: {NFC: {} }
    r.start

## Resources

* Using the ruby-nfc gem http://www.jamesrobertson.eu/snippets/2016/feb/08/using-the-ruby-nfc-gem.html

humblerpi nfc rfid gem plugin
