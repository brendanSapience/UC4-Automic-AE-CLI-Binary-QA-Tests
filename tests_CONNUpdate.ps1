. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "CONN_Update.jar"
$ObjectNameSQL = "JAVA.API.CONN.SQL.1"
$ObjectNameRA = "JAVA.API.CONN.FTP.1"

$ObjectNameRESTV3 = "JAVA.API.CONN.RESTV3.1"
$ObjectNameSOAPV3 = "JAVA.API.CONN.SOAPV3.1"
$ObjectNameRESTV4 = "JAVA.API.CONN.RESTV4.1"
$ObjectNameSOAPV4 = "JAVA.API.CONN.SOAPV4.1"

$FolderName = "API.TESTS.TARGET"

# Creating an object
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.SQL' -name '$ObjectNameSQL' -folder '$FolderName'" 0

 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.FTPAGENT.FTPCONNECTION' -name '$ObjectNameRA' -folder '$FolderName'" 0

 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.WEBSERVICE.RESTCONNECTION' -name '$ObjectNameRESTV3' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.WEBSERVICE.SOAPCONNECTION' -name '$ObjectNameSOAPV3' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.WEBSERVICEREST.RESTCONNECTION' -name '$ObjectNameRESTV4' -folder '$FolderName'" 0
 AddToATestCaseSuiteFull "OBjECTS_Create.jar" "-commit -check -template 'CONN.WEBSERVICESOAP.SOAPCONNECTION' -name '$ObjectNameSOAPV4' -folder '$FolderName'" 0

 # SQL
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"
 
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_alt_login 'NEW.LOGIN'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_name 'DB.NAME'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_port '1234'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_pwd 'myPwd'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_server 'myServer'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_type 'WRONGDBTYPE'" 1000 "Error" ""
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_type 'POSTGRESQL'" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSQL' -u_db_user 'sa'" 0 "" "Error"

 #FTP
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"

 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -ra_addval `"['activeMode','false']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -ra_addval `"['hostName','my.new.host.1']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -ra_addval `"['userId','newbsp']`"" 0 "" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRA' -ra_addval `"['port','2121']`"" 0 "" "Error"

 #SOAP V3
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV3' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV3' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV3' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"
 
 #REST V3
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV3' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV3' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV3' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"
 
 #SOAP V4
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV4' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV4' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameSOAPV4' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"
 
 #REST V4
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV4' -u_title `"['.*','My New Title']`"" 0 "Title" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV4' -u_arch1 `"['.*','My New Archive 1']`"" 0 "Archive" "Error"
 AddToATestCaseSuiteFullWithKeywordChecks $JavaBin "-commit -name '$ObjectNameRESTV4' -u_arch2 `"['.*','My New Archive 2']`"" 0 "Archive" "Error"
 


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