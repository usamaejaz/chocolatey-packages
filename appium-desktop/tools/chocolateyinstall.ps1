
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.12.1/Appium-windows-1.12.1.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.12.1/Appium-windows-1.12.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = '7F8A4D1E81479262AA2E025B10DE2EB0D92921ED3705603134024BBDE5CE9624'
  checksumType  = 'sha256'
  checksum64      = '7F8A4D1E81479262AA2E025B10DE2EB0D92921ED3705603134024BBDE5CE9624'
  checksumType64  = 'sha256'

  silentArgs    = "/S" # "--silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
