. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "JOBF_Update.jar"
$ObjectName = "JAVA.API.JOBF.TEST.1"
$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBF' -name '$ObjectName' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_active N" 0 "Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_genatruntime Y" 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_login `"['.*','LOGIN.GENERAL']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_host `"['.*','WIN01']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_deamode `"EFEXEC`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_deastatus `"ENDED_OK`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_deadelay 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_maxruns 20" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_process `"['.*','My New Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_preprocess `"['.*','My New Pre Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_postprocess `"['.*','My New Post Process!']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_priority 50" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_queue `"['.+','MY.QUEUE']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -abort_on_err Y" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_dest_file `"['.*','c:/myFileDest*.test']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_erase_source Y" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_dfile_exist OVERWRITE" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_host_from `"['.*','HOST.FROM']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_host_to `"['.*','HOST.TO']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_inc_subdirs Y" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_keep_attr Y" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_login_from `"['.*','LOGIN.FROM']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_login_to `"['.*','LOGIN.TO']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_maxtrans 31" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_set_wildcard Y" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_source_file `"['.*','c:/myFileSource*.test']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_trans_fold_struct Y" 0


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