
$QAPATH = "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests"
. "$QAPATH\cli_lib.ps1"

$CurrentPath = $PSScriptRoot

cd $QAPATH

Get-Childitem -Path $CurrentPath -Filter tests_*.ps1 | % {
Write-Host "`n`n +++ Running: $($_.Name) +++"
cd $QAPATH

& .\$($_.Name)

}

cd $QAPATH