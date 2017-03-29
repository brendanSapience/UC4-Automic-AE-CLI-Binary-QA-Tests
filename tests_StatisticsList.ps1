. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "STATISTICS_List.jar"
$ObjectName = "JAVA.API.SCRI.1"
$FolderName = "API.TESTS.TARGET"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_rangestarttime `"['20170101-0000','20180101-0000']`" -fr_rangeendtime `"['20170101-000','20180101-0000']`"" 1000 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_rangestarttime `"['20170101-0000','20180101-000']`" -fr_rangeendtime `"['20170101-0000','20180101-0000']`"" 1000 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_rangestarttime `"['20170101-0000','20180101-000']`" -fr_rangeendtime `"['20170101-0000','20180101-0000']`"" 1000 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_rangestarttime `"['20170101-0000','20180101-0000']`" -fr_rangeendtime `"['20170101-000','20180101-0000']`"" 1000 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_rangestarttime `"['20170101-000','20180101-0000']`" -fr_rangeendtime `"['20170101-000','20180101-0000']`"" 1000 "Error" ""

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_type 'JOBS' -fr_rangestarttime `"['20170101-0000','20180101-0000']`" -fr_rangeendtime `"['20170101-0000','20180101-0000']`"" 1000 "" "Error"

  AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -fr_name '*' -fr_type 'JOBS' -fr_rangestarttime `"['20170101-0000','20170115-0000']`" " 0 "" "Error"

 #AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath