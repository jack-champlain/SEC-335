if ($args.Count -ne 2) {
    Write-Host "Usage: .\dns_lookup.ps1 <network_prefix> <dns_server>"
    Write-Host "Example: .\dns_lookup.ps1 192.168.3 192.168.4.4"
    exit
}

$networkPrefix = $args[0]
$dnsServer = $args[1]

# Loop through IP addresses from .1 to .254
For ($i = 1; $i -le 254; $i++) {
    $fullIp = "$networkPrefix.$i"

    # Perform DNS lookup using the provided DNS server
    try {
        $dnsResult = Resolve-DnsName -Name $fullIp -Server $dnsServer -ErrorAction Stop
        if ($dnsResult) {
            $hostname = $dnsResult.NameHost
            Write-Host "$fullIp resolves to $hostname"
        }
    } catch {

    }
}
