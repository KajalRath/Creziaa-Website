param(
    [string]$token
)

# Set TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if (-not $token) {
    Write-Host "=========================================" -ForegroundColor Cyan
    Write-Host "  GitHub Direct Upload Script (No Git)  " -ForegroundColor Cyan
    Write-Host "=========================================" -ForegroundColor Cyan
    Write-Host ""
    $token = Read-Host -Prompt "Enter your GitHub Personal Access Token (PAT) with 'repo' scope"
}

if (-not $token) {
    Write-Error "Token is required to authenticate with GitHub."
    exit
}

$owner = "KajalRath"
$repo = "Creziaa-Website"
$files = @(
    "index.html", 
    "code.html", 
    "DESIGN.md",
    "images/addish_royal_food.png",
    "images/yuvraj_restaurant.png",
    "images/yuvraj_dhaba.png",
    "images/shemrock_preschool.png",
    "images/pindhan_fashion.png"
)

foreach ($file in $files) {
    $filePath = Join-Path $PSScriptRoot $file
    if (-not (Test-Path $filePath)) {
        Write-Host "File not found: $file" -ForegroundColor Yellow
        continue
    }
    
    Write-Host "Processing $file..." -ForegroundColor Cyan
    $contentBytes = [System.IO.File]::ReadAllBytes($filePath)
    $base64Content = [Convert]::ToBase64String($contentBytes)
    
    # 1. Check if file already exists to get its SHA
    $apiUrl = "https://api.github.com/repos/$owner/$repo/contents/$file"
    $headers = @{
        "Authorization" = "Bearer $token"
        "Accept"        = "application/vnd.github.v3+json"
        "User-Agent"    = "PowerShellScript"
    }
    
    $sha = $null
    try {
        $existingFile = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get -ErrorAction Stop
        $sha = $existingFile.sha
        Write-Host "Found existing file $file in repository. Preparing to overwrite..." -ForegroundColor Gray
    } catch {
        Write-Host "File $file not found in repository. Creating new file..." -ForegroundColor Gray
    }
    
    # 2. Commit file
    $body = @{
        message = "Upload $file via API"
        content = $base64Content
    }
    if ($sha) {
        $body.sha = $sha
    }
    $jsonBody = ConvertTo-Json $body -Depth 10
    
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Put -Body $jsonBody -ContentType "application/json" -ErrorAction Stop
        Write-Host "Successfully uploaded $file to GitHub!" -ForegroundColor Green
    } catch {
        Write-Error "Failed to upload $file: $_"
    }
    Write-Host ""
}

Write-Host "Upload complete! You can now deploy this repo to Vercel." -ForegroundColor Green
