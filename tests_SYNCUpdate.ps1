. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "SYNC_Update.jar"
$ObjectName = "JAVA.API.SYN.1"

$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SYNC' -name '$ObjectName' -folder '$FolderName'" 0


 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_title `"['.*','My New Title']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch1 `"['.*','My New Archive 1']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch2 `"['.*','My New Archive 2']`"" 0 "" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_addstate 'OFF'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_addstate 'ON'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -d_mon" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_setmon [OFF,21]" 0 "" "Error"


 # Deleting the object
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameStd' -folder '$FolderName' -f_incsub" 0
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameFE' -folder '$FolderName' -f_incsub" 0
 #AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectNameIF' -folder '$FolderName' -f_incsub" 0

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