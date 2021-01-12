
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.20.0/Appium-windows-1.20.0.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.20.0/Appium-windows-1.20.0.exe'
$checksum = '39ddbf1ca81eed6efdd4518b3192a13a68106849f79275b9204a8ec33e569af6'
$checksum64 = '39ddbf1ca81eed6efdd4518b3192a13a68106849f79275b9204a8ec33e569af6'

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
