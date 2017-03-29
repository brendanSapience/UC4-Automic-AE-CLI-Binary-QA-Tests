. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "AGENTS_Management.jar"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -f_name '.*' -f_title '.*' -f_type '.*' -f_category '.*'" 0 "" "Error"

 #AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath