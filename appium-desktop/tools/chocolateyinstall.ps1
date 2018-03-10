
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.4.1/appium-desktop-Setup-1.4.1-ia32.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Appium*'

  checksum      = '9008D64A3DE1CC635A0710E73BA54473193CF0E3BC8C1A8E8B4780F9A46F5777'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
