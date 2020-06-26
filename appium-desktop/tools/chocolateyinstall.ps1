
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.15.1/Appium-windows-1.15.1.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.15.1/Appium-windows-1.15.1.exe'
$checksum = '10c51366a351c7260c2824fcad417f35664c89d08b576cb702f5c1e24abba826'
$checksum64 = '10c51366a351c7260c2824fcad417f35664c89d08b576cb702f5c1e24abba826'

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
