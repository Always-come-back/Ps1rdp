# Windows Güvenlik Duvarını devre dışı bırak
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Chrome'u indir ve kur
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$chromeInstaller = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest -Uri $chromeUrl -OutFile $chromeInstaller
Start-Process -FilePath $chromeInstaller -ArgumentList "/silent /install" -Wait

# Chrome Remote Desktop'u indir ve kur
$remoteDesktopUrl = "https://dl.google.com/chrome-remote-desktop/chrome_remote_desktop_installer.exe"
$remoteDesktopInstaller = "$env:TEMP\chrome_remote_desktop_installer.exe"
Invoke-WebRequest -Uri $remoteDesktopUrl -OutFile $remoteDesktopInstaller
Start-Process -FilePath $remoteDesktopInstaller -ArgumentList "/silent /install" -Wait

# İndirilmiş dosyaları sil
Remove-Item -Path $chromeInstaller, $remoteDesktopInstaller -Force -ErrorAction SilentlyContinue

Write-Host "Kurulum tamamlandı ve geçici dosyalar silindi." -ForegroundColor Green
