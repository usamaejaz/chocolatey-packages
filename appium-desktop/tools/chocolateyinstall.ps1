
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.2.7/appium-desktop-Setup-1.2.7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Appium*'

  checksum      = 'E493BD78610441A20D3555CD1EA8C254A8A95B09B5A914F931CFDFEBED220074'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs










    








