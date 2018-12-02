
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.8.2/appium-desktop-Setup-1.8.2-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.8.2/appium-desktop-setup-1.8.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = 'D536B8A205DCAA9EC6779D8A2984E730FA6249F8A3D2B82935CABDA2E25954C8'
  checksumType  = 'sha256'
  checksum64      = '2E7E584DB233E0592FCCFF217258B4DC00C0070F767FB551384469E113776B92'
  checksumType64  = 'sha256'

  silentArgs    = "/S" # "--silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
