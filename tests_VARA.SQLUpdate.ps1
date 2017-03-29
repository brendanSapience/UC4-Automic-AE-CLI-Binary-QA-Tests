. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"


$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "VARA_SQL_Update.jar"
$ObjectNameSQL = "JAVA.API.VARA.SQL.1"
$ObjectNameSECSQL = "JAVA.API.VARA.SECSQL.1"
$ObjectNameSQLI = "JAVA.API.VARA.SQLI.1"
$ObjectNameSECSQLI = "JAVA.API.VARA.SECSQLI.1"

$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SQL' -name '$ObjectNameSQL' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SEC_SQL' -name '$ObjectNameSECSQL' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SQLI' -name '$ObjectNameSQLI' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'VARA.SEC_SQLI' -name '$ObjectNameSECSQLI' -folder '$FolderName'" 0


 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_connection `"['.*','NEW.CONNECTION']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_login `"['.*','NEW.LOGIN']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_sql `"['.*','NEW.SQL Stuff']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_format `"['.*','1_2']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_user_def Y" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_connection `"['.*','NEW.CONNECTION']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_login `"['.*','NEW.LOGIN']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_sql `"['.*','NEW.SQL Stuff']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_format `"['.*','1_2']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_user_def Y" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_sqli_sql `"['.*','new sql query']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_sqli_ora `"['.*','new ora query']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQLI' -u_sqli_db2 `"['.*','new DB2 query']`"" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_connection `"['.*','NEW.CONNECTION']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_login `"['.*','NEW.LOGIN']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_sql `"['.*','NEW.SQL Stuff']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_format `"['.*','1_2']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_user_def Y" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_sec_add_param ALLO" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_sec_add_param DOGGIE" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_sec_add_param SUN" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQL' -u_sec_del_param DOGGIE" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_connection `"['.*','NEW.CONNECTION']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_login `"['.*','NEW.LOGIN']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sql `"['.*','NEW.SQL Stuff']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_format `"['.*','1_2']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_user_def Y" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sec_add_param ALLO" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sec_add_param DOGGIE" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sec_add_param SUN" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sec_del_param DOGGIE" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sqli_sql `"['.*','new sql query']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sqli_ora `"['.*','new ora query']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSECSQLI' -u_sqli_db2 `"['.*','new DB2 query']`"" 0 "" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath