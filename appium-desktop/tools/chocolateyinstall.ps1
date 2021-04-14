
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.20.2/Appium-windows-1.20.2.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.20.2/Appium-windows-1.20.2.exe'
$checksum = '041e35db93ea38ba5d41282caadb5e26c7ace5984707cbe323fcee07e4b5af07'
$checksum64 = '041e35db93ea38ba5d41282caadb5e26c7ace5984707cbe323fcee07e4b5af07'

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
