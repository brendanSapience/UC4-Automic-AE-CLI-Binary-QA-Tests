. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "CALL_Update.jar"
$ObjectNameSTD = "JAVA.API.CALL.1"
$ObjectNameMAIL = "JAVA.API.MAIL.1"
$ObjectNameALARM = "JAVA.API.ALARM.1"
$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CALL.STANDARD' -name '$ObjectNameSTD' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CALL.MAIL' -name '$ObjectNameMAIL' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CALL.ALARM' -name '$ObjectNameALARM' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_active N" 0 "Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_addemail `"['bsp@automic.com']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_addemail `"['bsa@automic.com','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_addop `"['ARA']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_addop `"['BSP','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_call_priority 'HIGH'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_subject `"['.*','My New subject']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSTD' -u_message `"['.*','My New message!']`"" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_active N" 0 "Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_addemail `"['bsp@automic.com']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_addemail `"['bsa@automic.com','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_addop `"['ARA']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_addop `"['BSP','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_call_priority 'HIGH'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_subject `"['.*','My New subject']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameMAIL' -u_message `"['.*','My New message!']`"" 0

  AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_active N" 0 "Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_addemail `"['bsp@automic.com']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_addemail `"['bsa@automic.com','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_addop `"['ARA']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_addop `"['BSP','CALE.GENERAL','MY.KEYWORD']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_call_priority 'HIGH'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_subject `"['.*','My New subject']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameALARM' -u_message `"['.*','My New message!']`"" 0
 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

Write-Host "Number of Test Cases Found: $($TestCaseArray.Count)"

foreach ($testcase in $TestCaseArray) {
  #Write-host $testcase.Command
  #Write-host $testcase.RetCodeExpected

  $Params = $($testcase.Command)
  $command = "$JAVACMD $($testcase.BinaryName) $AUTHPARAMS $Params"
  Write-Host " %% Running Test: $command"
  $commandOutput = iex "& $command"
  $commandReturnCode = $lastExitCode
  #echo $commandOutput
  $Status = CheckReturnCode $($testcase.RetCodeExpected) $commandReturnCode
  if(-Not($Status)){
  Write-Host " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
  #write-Host " Output is: "
 
  }else{

      $ErrorFound = $false
      if($($testcase.KeywordsExpected)){
        
        $LogCheck = CheckOutputForKeywords $($testcase.KeywordsExpected) $commandOutput
        if(-Not($LogCheck)){
            Write-Host " -- Test Failed on Log Check. Not Found: [$($testcase.KeywordsExpected)]"
            $ErrorFound = $true
        }else{
            #Write-Host " ++ Test OK: $($testcase.Command)."
        }
       }
      if($($testcase.KeywordsExcluded)){
        $LogCheck = CheckOutputForKeywordsReverse $($testcase.KeywordsExcluded) $commandOutput
        if(-Not($LogCheck)){
            Write-Host " -- Test Failed on Log Check. Found: [$($testcase.KeywordsExcluded)]"
            $ErrorFound = $true
        }else{
            #Write-Host " ++ Test OK: $($testcase.Command)."
        }
       }

       if(-Not($ErrorFound)){
        Write-Host " ++ Test OK: $($testcase.Command)."
        #echo $commandOutput
      }
  }
  
 }


cd $CurrentPath