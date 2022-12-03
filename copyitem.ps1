Start-Process powershell -Verb runAs Administrator
Start-Transcript -OutputDirectory H:\PSTransciptlogs\
$Folder1path = "C:\Users\Nallamuthu\Downloads\Telegram Desktop\"
$Folder2path = "H:\Telegram_Downloads_Backup\Telegram Desktop\"
$Folder1 = Get-childitem -path $Folder1path -Recurse
$Folder2 = Get-childitem -path $Folder2path -Recurse
Compare-Object -ReferenceObject $folder1 -DifferenceObject $Folder2
Compare-Object $Folder1 $Folder2 -Property Name, Length  | 
Where-Object {$_.SideIndicator -eq "<="} | 
ForEach-Object {
            Copy-Item "$Folder1path\$($_.name)" -Destination "$Folder2path" -Force -Recurse
}

Write-Host "CI CD Enabled"
Stop-Transcript
