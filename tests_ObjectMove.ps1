. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBJECTS_Move.jar"
$ObjectName1 = "JAVA.API.SCRI.MOVE.1"
$ObjectName2 = "JAVA.API.JOBS.MOVE.1"
$ObjectName3 = "JAVA.API.JOBF.MOVE.1"
$FolderNameSource = "API.TESTS.TARGET"
$FolderNameTarget = "API.TESTS.MOVED"
$FolderNameTargetNoExist = "API.TESTS.MOVED.INEXISTANT"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SCRI' -name '$ObjectName1' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBS.WIN' -name '$ObjectName2' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBF' -name '$ObjectName3' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'FOLD' -name '$FolderNameTarget' -folder '$FolderNameSource'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName1' -folder '$FolderNameTargetNoExist'" 998 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName1' -folder '$FolderNameTarget'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name 'JAVA.API.*.MOVE.*' -folder '$FolderNameTarget'" 0 "" "Error"


 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath