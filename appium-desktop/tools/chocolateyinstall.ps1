
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.1/appium-desktop-Setup-1.6.1-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.1/appium-desktop-setup-1.6.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = '1ACAE513C9E8C81AD42FC72A50481ACAC924453F08854A5BE68EE03EFC539DA9'
  checksumType  = 'sha256'
  checksum64      = '019F69C662D5888F851CFE2782B76642462B34E5082A709D1BB7D258F659C4B7'
  checksumType64  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
