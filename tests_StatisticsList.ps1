. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
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