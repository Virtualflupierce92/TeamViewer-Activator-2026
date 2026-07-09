class ServerInfo {
    [string]$Name
    [string]$Status
    [int]$Port

    ServerInfo([string]$name, [string]$status, [int]$port) {
        $this.Name = $name
        $this.Status = $status
        $this.Port = $port
    }
}

$servers = @()

$servers += [ServerInfo]::new("WebServer", "Online", 80)
$servers += [ServerInfo]::new("Database", "Online", 5432)
$servers += [ServerInfo]::new("Cache", "Offline", 6379)
$servers += [ServerInfo]::new("ApiGateway", "Online", 8080)

Write-Host "Server Status Report"
Write-Host "===================="

foreach ($server in $servers) {
    "{0,-12} {1,-8} Port {2}" -f $server.Name, $server.Status, $server.Port
}

$onlineCount = ($servers | Where-Object { $_.Status -eq "Online" }).Count

Write-Host "===================="
Write-Host "Online Servers: $onlineCount"
