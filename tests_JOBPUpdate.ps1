﻿. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "JOBP_Update.jar"
$ObjectNameStd = "JAVA.API.JOBP.STD"
$ObjectNameFE = "JAVA.API.JOBP.FE"
$ObjectNameIF = "JAVA.API.JOBP.IF"
$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBP.STANDARD' -name '$ObjectNameStd' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBP.FOREACH' -name '$ObjectNameFE' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBP.IF' -name '$ObjectNameIF' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_active N" 0 "Job Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameFE' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_active N" 0 "Job Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameIF' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_active N" 0 "Job Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameStd' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"

 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameStd' -folder '$FolderName' -f_incsub" 0
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameFE' -folder '$FolderName' -f_incsub" 0
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameIF' -folder '$FolderName' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath