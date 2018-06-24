
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.2/appium-desktop-Setup-1.6.2-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/v1.6.2/appium-desktop-setup-1.6.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = '1C8CB939698C04F3410944F498AD30183DE97357D3B0AEA8B773C77B337DD64F'
  checksumType  = 'sha256'
  checksum64      = 'DD8FC52569DCD0C40C4DDF7113F66A8ACCC02C73FEFEFB57DE94CA3579D6EF72'
  checksumType64  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
