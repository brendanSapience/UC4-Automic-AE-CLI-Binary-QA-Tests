. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "USER_Update.jar"
$ObjectName = "MYUSER.API/AUTOMIC"
$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'USER' -name '$ObjectName' -folder '$FolderName'" 0

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_title `"['.*','My New Title']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch1 `"['.*','My New Archive 1']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_arch2 `"['.*','My New Archive 2']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_lock" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_unlock" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_lastname `"['.*','Sapience']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_firstname `"['.*','Brendan']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_email1 `"['.*','bsp@automic.com']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_email2 `"['.*','bsa@automic.com']`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_give_all" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_pwd 'password'" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add_auth `"[1|*|*|*|*|*|*|*|*|true,true,true,true,true,true,false,false,false]`"" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add_priv `"[ACCESS_NOFOLDER,ACCESS_RECYCLE_BIN,ACCESS_TRANSPORT_CASE,AUTO_FORECAST]`"" 0
 # Not sure why the below command isnt work?! weird..
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_add_priv '*'" 0
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectName' -u_del_priv `"[ACCESS_NOFOLDER,ACCESS_RECYCLE_BIN]`"" 0

 # Deleting the object
 AddToATestCaseSuiteFull "OBjECTS_Delete.jar" "-commit -name '$ObjectName' -folder '$FolderName' -f_incsub" 0

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