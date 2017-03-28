. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBJECTS_Move.jar"
$ObjectName1 = "JAVA.API.SCRI.MOVE.1"
$ObjectName2 = "JAVA.API.JOBS.MOVE.1"
$ObjectName3 = "JAVA.API.JOBF.MOVE.1"
$FolderNameSource = "API.TESTS.TARGET"
$FolderNameTarget = "API.TESTS.MOVED"
$FolderNameTargetNoExist = "API.TESTS.MOVED.INEXISTANT"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SCRI' -name '$ObjectName1' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBS.WIN' -name '$ObjectName2' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBF' -name '$ObjectName3' -folder '$FolderNameSource'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'FOLD' -name '$FolderNameTarget' -folder '$FolderNameSource'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName1' -folder '$FolderNameTargetNoExist'" 998 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName1' -folder '$FolderNameTarget'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name 'JAVA.API.*.MOVE.*' -folder '$FolderNameTarget'" 0 "" "Error"


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