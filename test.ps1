$NicConfig = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration
#$NicConfig | Where-Object {$_.IPEnabled} | Select-Object IPAddress , Index
#$NicConfig | Get-Member
#$NicConfig[0..5] | Select-Object Description , IPAddress
#$NicConfig[2].Description.GetType()
#$NicConfig[2].IPAddress[0].GetType()

## Условие Foreach object
$NicConfig | ForEach-Object {  if ($_.IPEnabled -eq $true) {
        $_.IPAddress
    }
 }

 # 1. Получите данные
$NicConfig = Get-CimInstance Win32_NetworkAdapterConfiguration

# 2. Посмотрите, сколько элементов
$NicConfig.Count

# 3. Посмотрите первый элемент и его свойства
$NicConfig[0] | Format-List *

# 4. Пройдитесь по всем элементам, выводя только нужное
$NicConfig | ForEach-Object {
    [PSCustomObject]@{
        Description = $_.Description
        IP = $_.IPAddress -join ", "
        MAC = $_.MACAddress
        DHCP = $_.DHCPEnabled
    }
} | Format-Table -AutoSize