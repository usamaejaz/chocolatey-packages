$versionToUse = $args[0]

if(-Not $versionToUse){
    Write-Host 'No version specified'
    Exit
}

import-module au

$releases = 'https://github.com/appium/appium-desktop/releases'
function global:au_SearchReplace {
    @{
       ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

# function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing 
    
    $re      = 'Appium-windows-' + $versionToUse + '.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    # $url64   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

    return @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor all -NoCheckChocoVersion