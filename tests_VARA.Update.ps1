. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "VARA_Update.jar"
$ObjectNameSQL = "JAVA.API.VARA.SQL.GEN.1"
$ObjectNameSECSQL = "JAVA.API.VARA.SECSQL.GEN.1"
$ObjectNameSQLI = "JAVA.API.VARA.SQLI.GEN.1"
$ObjectNameSECSQLI = "JAVA.API.VARA.SECSQLI.GEN.1"

$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SQL' -name '$ObjectNameSQL' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SEC_SQL' -name '$ObjectNameSECSQL' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SQLI' -name '$ObjectNameSQLI' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SEC_SQLI' -name '$ObjectNameSECSQLI' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_arch2 `"['.*','My New Archive 2']`"" 0

  AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_arch2 `"['.*','My New Archive 2']`"" 0

  AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_arch2 `"['.*','My New Archive 2']`"" 0

  AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_arch2 `"['.*','My New Archive 2']`"" 0


 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath