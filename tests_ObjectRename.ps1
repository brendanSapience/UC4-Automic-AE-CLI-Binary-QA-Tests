. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBJECTS_Rename.jar"
$ObjectName1 = "JAVA.API.SCRI.RENAME.1"
$ObjectName1New = "JAVA.API.SCRI.RENAME.1.RENAMED"
$ObjectName2 = "JAVA.API.JOBS.RENAME.1"
$ObjectName3 = "JAVA.API.JOBF.RENAME.1"
$FolderName = "API.TESTS.TARGET"


# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'SCRI' -name '$ObjectName1' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBS.WIN' -name '$ObjectName2' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'JOBF' -name '$ObjectName3' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -deep -name '$ObjectName1' -d_name `"['$ObjectName1','$ObjectName1New']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -deep -name 'JAVA.API.*.RENAME.*' -d_pattern `"['1','1.RENAMED']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -d_usage -name '$ObjectName1New'" 0 "" "Error"

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