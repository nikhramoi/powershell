function Get-Addr {
    [CmdletBinding()]
    param(
        [Parameter()]
        [bool]$IPEnabled = $true
    )
    
    begin {
        $NicConfig = Get-CimInstance Win32_NetworkAdapterConfiguration
        $IPAddresses = @()
        $counter = 0
    }
    
    process {
        foreach ($nic in $NicConfig) {
            if ($nic.IPEnabled -eq $IPEnabled) {
                $IP = [PSCustomObject]@{
                Name = $nic.Description
                IPAddress = $nic.IPAddress[0]
                Status = $nic.IPEnabled
        }
        $IPAddresses += $IP
        $counter += 1
    }
}
    }
    
    end {
        # Выполняется после обработки всех объектов
        Write-Verbose "Завершено. Обработано элементов: $counter"
        $IPAddresses | Format-Table
    }
}

Get-Addr