
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.18.3/Appium-windows-1.18.3.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.18.3/Appium-windows-1.18.3.exe'
$checksum = '9b5ed84e40faceb20a31b5732c532117bbe3a8c974e987ce5b1493140e5e2e79'
$checksum64 = '9b5ed84e40faceb20a31b5732c532117bbe3a8c974e987ce5b1493140e5e2e79'

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
