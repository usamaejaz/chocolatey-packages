
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/appium/appium-desktop/releases/download/1.7.0/appium-desktop-Setup-1.7.0-ia32.exe'
$url64        = 'https://github.com/appium/appium-desktop/releases/download/1.7.0/appium-desktop-setup-1.7.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64           = $url64

  softwareName  = 'Appium*'

  checksum      = '605DF455A79C7B2B3906C2601D7488AD09F509B8D9CF7AD799CA194EB02949AA'
  checksumType  = 'sha256'
  checksum64      = 'E891C8D31842EA532CB1DD608DF05F32CDAABF6E6616A6B75A4FFA3C886B3AD6'
  checksumType64  = 'sha256'

  silentArgs    = "/S" # "--silent"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
