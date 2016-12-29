﻿$packageName = 'rufus.portable'
$url = 'http://rufus.akeo.ie/downloads/rufus-2.11p.exe'
$checksum = '878b1620889da7685b0117cd83436bcef6351d717f4d94469bee182bff148714'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installFile = Join-Path $toolsDir "rufusp.exe"
try {
  Get-ChocolateyWebFile -PackageName "$packageName" `
                        -FileFullPath "$installFile" `
                        -Url "$url" `
                        -Checksum "$checksum" `
                        -ChecksumType "$checksumType"
  Set-Content -Path ("$installFile.gui") `
              -Value $null
} catch {
  throw $_.Exception
}