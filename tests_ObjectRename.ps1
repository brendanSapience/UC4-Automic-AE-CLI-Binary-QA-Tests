. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"


$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBJECTS_Rename.jar"
$ObjectName1 = "JAVA.API.SCRI.RENAME.1"
$ObjectName1New = "JAVA.API.SCRI.RENAME.1.RENAMED"
$ObjectName2 = "JAVA.API.JOBS.RENAME.1"
$ObjectName3 = "JAVA.API.JOBF.RENAME.1"
$FolderName = "API.TESTS.TARGET"


# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SCRI' -name '$ObjectName1' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBS.WIN' -name '$ObjectName2' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBF' -name '$ObjectName3' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -deep -name '$ObjectName1' -d_name `"['$ObjectName1','$ObjectName1New']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -deep -name 'JAVA.API.*.RENAME.*' -d_pattern `"['1','1.RENAMED']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -d_usage -name '$ObjectName1New'" 0 "" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath