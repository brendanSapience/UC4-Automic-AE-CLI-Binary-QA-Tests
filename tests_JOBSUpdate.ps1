. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "JOBS_Update.jar"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin '-commit -name "JAVA.API.JOBS.JOBS_WIN.1" -u_active N' 0 "Job Set To Inactive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin '-commit -name "JAVA.API.JOBS.JOBS_WIN.1" -u_genatruntime Y' 0 "Generate At Runtime Activated" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_addvar `"['Allo#','My Value']`"" 0 "Add Variable - Name: Allo# | Value: My Valu" "Error"
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_title `"['.*','My New Title']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_login `"['.*','LOGIN.GENERAL']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_host `"['.*','WIN01']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_arch1 `"['.*','My New Archive 1']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_arch2 `"['.*','My New Archive 2']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_deamode `"EFEXEC`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_deastatus `"ENDED_OK`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_deadelay 20" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_maxruns 20" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_process `"['.*','My New Process!']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_preprocess `"['.*','My New Pre Process!']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_postprocess `"['.*','My New Post Process!']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_priority 50" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_queue `"['.+','MY.QUEUE']`"" 0
 #AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_updvar `"['Allo#','My New Value']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -u_updvar `"['NOVAR#','My New Value']`"" 0 "Could Not Update,Variable Not Found" "Error"

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