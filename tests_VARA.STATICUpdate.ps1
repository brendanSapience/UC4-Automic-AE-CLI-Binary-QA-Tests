. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "VARA_STATIC_Update.jar"
$ObjectName = "JAVA.API.VARA.STATIC.GEN.1"

$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.STATIC' -name '$ObjectName' -folder '$FolderName'" 0


 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add `"['KEY1','Value 1','value 2','123','My Other Text','value 5']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add `"['KEY2','Value 1','value 2','123','My Other, Text','value 5']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add `"['KEY3','Value 1','value 2','123','My Other, Text','value 5']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add `"['KEY4','&MYVAR#','value 2','123','My Other, Text','value 5']`"" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_del `"['KEY3','.*','.*','.*','.*','.*']`"" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_upd_src `"['KEY2','.*','.*','.*','.*','.*']`" -u_upd_trg `"['','new value 1','new value 2','','','']`"" 0 "" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath