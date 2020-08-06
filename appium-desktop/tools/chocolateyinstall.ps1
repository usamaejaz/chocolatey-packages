
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.18.0/Appium-windows-1.18.0.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.18.0/Appium-windows-1.18.0.exe'
$checksum = '500844b0b6b629797576cb3989c266685eecaf1398afe34db3049a8ea0a3f5af'
$checksum64 = '500844b0b6b629797576cb3989c266685eecaf1398afe34db3049a8ea0a3f5af'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64      = $checksum64
  checksumType64  = 'sha256'

  silentArgs    = "/S" # "--silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
