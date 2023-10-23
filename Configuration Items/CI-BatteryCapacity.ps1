<#
    .SYNOPSIS
        Get remaining battery capacity
    .DESCRIPTION
        Returns percentage (integer number) of designed battery capacity.
    .NOTES
        As for me, my compliance rule is set to fail if it falls below 30%.
        Part of device health baseline. 
    .LINK
        https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-battery
        Ryzhov Alexander <github@ryzhov.su> 
        https://github.com/ryzhovau
#>

return [int]((Get-WmiObject -Namespace root/wmi -Class BatteryFullChargedCapacity).FullChargedCapacity / (Get-WmiObject -Namespace root/wmi -Class BatteryStaticData).DesignedCapacity * 100)
