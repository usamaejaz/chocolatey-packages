
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.3/appium-desktop-Setup-1.6.3-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.3/appium-desktop-setup-1.6.3.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = 'FCF58F1445770B3AF097B155A2AAAF18942AC4E88B245C3950A67AEDD5B94720'
  checksumType  = 'sha256'
  checksum64      = 'C792FE7ACC9FC88CD3E7F00ADCA7C1C994B7F63BC83C5AAB201763D393AB6112'
  checksumType64  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
