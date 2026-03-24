$NicConfig = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration
#$NicConfig | Where-Object {$_.IPEnabled} | Select-Object IPAddress , Index
#$NicConfig | Get-Member
#$NicConfig[0..5] | Select-Object Description , IPAddress
$NicConfig[2].Description.GetType()
$NicConfig[2].IPAddress[0].GetType()