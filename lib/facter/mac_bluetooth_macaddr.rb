#mac_bluetooth_macaddr.rb
Facter.add(:mac_bluetooth_macaddr) do
  confine :kernel => "Darwin"
  mac_bluetooth_macaddr = Facter::Util::Resolution.exec("ioreg -c IOBluetoothHCIController | grep -w BluetoothDeviceAddress | awk '{print $5}' |  sed 's/-/:/g' | tr '[:upper:]' '[:lower:]'")
  setcode do
    mac_bluetooth_macaddr.gsub(/"/, "")
  end
end