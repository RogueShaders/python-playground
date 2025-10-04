Write-Host

Write-Host
python -m pytest test_app.py
if ($LASTEXITCODE -ne 0) {
    Write-Error "Tests failed. Stopping pipelinr."
    exit 1
}

Write-Host
Compress-Archive -Path app.py -DestinationPath 
build.zip -Force

Write-Host
Expand-Archive -Path build.zip -DestinationPath
deployed -Force

Write-Host
Start-Process powershell -ArgumentList

Write-Host