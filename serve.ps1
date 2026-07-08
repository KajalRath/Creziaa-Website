$port = 8080
if ($args[0]) { $port = [int]$args[0] }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
try {
    $listener.Start()
} catch {
    Write-Error "Failed to start listener on port $port. Try another port: $_"
    exit 1
}

Write-Host "Server started successfully."
Write-Host "Local Host URL: http://localhost:$port/"
Write-Host "Press Ctrl+C to stop the server."

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $url = $request.Url.LocalPath
        if ($url -eq "/") { $url = "/code.html" }
        Write-Host "$(Get-Date -Format 'HH:mm:ss') - Request: $url"

        
        $url = [System.Uri]::UnescapeDataString($url)
        # Convert web slashes to windows path slashes
        $url = $url.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        # Trim leading slash if present to avoid Join-Path issues
        if ($url.StartsWith([System.IO.Path]::DirectorySeparatorChar)) {
            $url = $url.Substring(1)
        }

        $filePath = Join-Path (Get-Location) $url

        if (Test-Path $filePath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            switch ($ext) {
                ".html" { $response.ContentType = "text/html; charset=utf-8" }
                ".css" { $response.ContentType = "text/css; charset=utf-8" }
                ".js" { $response.ContentType = "application/javascript; charset=utf-8" }
                ".png" { $response.ContentType = "image/png" }
                ".jpg" { $response.ContentType = "image/jpeg" }
                ".jpeg" { $response.ContentType = "image/jpeg" }
                ".gif" { $response.ContentType = "image/gif" }
                ".svg" { $response.ContentType = "image/svg+xml" }
                ".ico" { $response.ContentType = "image/x-icon" }
                default { $response.ContentType = "application/octet-stream" }
            }
            
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            $response.OutputStream.Close()
            Write-Host "$(Get-Date -Format 'HH:mm:ss') - Response: 200 OK ($($bytes.Length) bytes)"
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.ContentLength64 = $errBytes.Length
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
            $response.OutputStream.Close()
            Write-Host "$(Get-Date -Format 'HH:mm:ss') - Response: 404 Not Found"
        }
    } catch {
        # Log exception details for troubleshooting but don't terminate server
        Write-Host "Request handler exception: $_"
    } finally {
        if ($response) {
            try { $response.Close() } catch {}
        }
    }
}
