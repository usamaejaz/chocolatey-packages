
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.7.1/appium-desktop-Setup-1.7.1-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.7.1/appium-desktop-setup-1.7.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = 'E0FDEB6D98F614E7FE93ABE46E0FEA04B4A44FA44DC346F190133801B8C4BF98'
  checksumType  = 'sha256'
  checksum64      = 'D329498F3C1979D6C140903509BA7A8EA6461021DDF65628AC56E46AC9E3E361'
  checksumType64  = 'sha256'

  silentArgs    = "/S" # "--silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
