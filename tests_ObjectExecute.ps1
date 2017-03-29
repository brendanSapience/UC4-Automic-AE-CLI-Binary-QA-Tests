. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBJECTS_Execute.jar"
$ObjectName = "JAVA.API.SCRI.RUN.1"
$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SCRI' -name '$ObjectName' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "SCRI_Update.jar" "-commit -name '$ObjectName' -u_process `"['.*',':PRINT Hello!']`"" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -e_ldate '20170101-2301' -e_now" 0 "RUNID" "Error"



 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath