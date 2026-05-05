Write-Host "`n=== SeeStar CleanUp (JPG + *_thn.jpg cleanup) ===" -ForegroundColor Cyan
Add-Type -AssemblyName Microsoft.VisualBasic

$allFolders = Get-ChildItem -Directory

$totalDeletedSub = 0
$totalDeletedThn = 0
$totalFreedBytes = 0

foreach ($folder in $allFolders) {

    if ($folder.Name -like "*_sub") {

        $jpgFiles = Get-ChildItem -Path $folder.FullName -Filter *.jpg -File
        $count = $jpgFiles.Count
        $totalFreedBytes += ($jpgFiles | Measure-Object -Property Length -Sum).Sum

        foreach ($file in $jpgFiles) {
            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
                $file.FullName,
                'OnlyErrorDialogs',
                'SendToRecycleBin'
            )
        }

        Write-Host "Folder " -NoNewline
        Write-Host "$($folder.Name)" -ForegroundColor Yellow -NoNewline

        if ($count -gt 0) {
            Write-Host ": moved " -NoNewline
            Write-Host "$count" -ForegroundColor Green -NoNewline
            Write-Host " JPG files to Recycle Bin"
            $totalDeletedSub += $count
        }
        else {
            Write-Host ": no JPG files found"
        }
    }

    else {

        $thnFiles = Get-ChildItem -Path $folder.FullName -Filter "*_thn.jpg" -File
        $count = $thnFiles.Count
        $totalFreedBytes += ($thnFiles | Measure-Object -Property Length -Sum).Sum

        foreach ($file in $thnFiles) {
            [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile(
                $file.FullName,
                'OnlyErrorDialogs',
                'SendToRecycleBin'
            )
        }

        Write-Host "Folder " -NoNewline
        Write-Host "$($folder.Name)" -ForegroundColor Yellow -NoNewline

        if ($count -gt 0) {
            Write-Host ": moved " -NoNewline
            Write-Host "$count" -ForegroundColor Red -NoNewline
            Write-Host " *_thn.jpg files to Recycle Bin"
            $totalDeletedThn += $count
        }
        else {
            Write-Host ": no *_thn.jpg files found"
        }
    }
}

$totalFreedMB = [math]::Round($totalFreedBytes / 1MB, 2)

Write-Host ""
Write-Host "Total freed space: " -NoNewline
Write-Host "$totalFreedMB MB" -ForegroundColor Cyan

Write-Host "Total JPG files from *_sub folders: " -NoNewline
Write-Host "$totalDeletedSub" -ForegroundColor Green

Write-Host "Total *_thn.jpg files from other folders: " -NoNewline
Write-Host "$totalDeletedThn" -ForegroundColor Red

Write-Host ""
Write-Host "Press Enter to close..."
Read-Host