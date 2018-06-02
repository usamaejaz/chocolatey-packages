﻿
$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Appium*'
  fileType      = 'exe'
  silentArgs    = "/S"
  validExitCodes= @(0)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $key | ForEach-Object { 
    $packageArgs['file'] = "$($_.UninstallString)"
    if ($packageArgs['fileType'] -eq 'MSI') {
      $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
      
      $packageArgs['file'] = ''
    } else {

      $uninstallString = $packageArgs['file'].split('"')
        
      if($uninstallString.Length -eq 3){
        $packageArgs['file'] = $uninstallString[1]
        if ($uninstallString[2].Trim(" ").Length -gt 0){
          $packageArgs['silentArgs'] = "$($packageArgs['silentArgs']) $($uninstallString[2].Trim(" "))"
        }
      }
    }

    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $($_.DisplayName)"}
}
