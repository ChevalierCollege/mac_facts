#mac_firmwarepass.rb
#requires setregproptool extracted from Firmware Password Utility installed to /usr/local/bin

require 'facter'
Facter.add(:mac_firmwarepass) do
  confine :kernel => "Darwin"
  setcode do
    osver = Facter.value('macosx_productversion_major')
    if osver == "10.10"
    output = Facter::Util::Resolution.exec("/usr/sbin/firmwarepasswd -check")
    fwpass_status = output.split("\n").first
      if fwpass_status=="Password Enabled: No"
        "false"
      else
        "true"
      end
    else
      "Not supported"
  end
end
end