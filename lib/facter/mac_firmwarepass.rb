#mac_firmwarepass.rb
#requires setregproptool extracted from Firmware Password Utility installed to /usr/local/bin
Facter.add(:mac_firmwarepass) do
  confine :kernel => "Darwin"
  setcode do
    fwpass_status = Facter::Util::Resolution.exec("/usr/local/bin/setregproptool -c")
    
    if fwpass_status == "0"
      "SET"
    end
    if fwpass_status == "1"
      "NOT SET"
    end
  end
end