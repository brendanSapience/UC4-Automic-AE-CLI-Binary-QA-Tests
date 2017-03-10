. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBjECTS_Create.jar"

AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_WIN" -name "JAVA.API.JOBS.JOBS_WIN.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_WIN" -name "JAVA.API.JOBS.JOBS_WIN.1" -folder "API.TESTS.TARGET"' 99

AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_UNIX" -name "JAVA.API.JOBS.JOBS_UNIX.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_UNIX" -name "JAVA.API.JOBS.JOBS_UNIX.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_SQL" -name "JAVA.API.JOBS.JOBS_SQL.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_SQL" -name "JAVA.API.JOBS.JOBS_SQL.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_VMS" -name "JAVA.API.JOBS.JOBS_VMS.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_VMS" -name "JAVA.API.JOBS.JOBS_VMS.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_JMX" -name "JAVA.API.JOBS.JOBS_JMX.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_JMX" -name "JAVA.API.JOBS.JOBS_JMX.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_OS400" -name "JAVA.API.JOBS.JOBS_OS400.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBS_OS400" -name "JAVA.API.JOBS.JOBS_OS400.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBF" -name "JAVA.API.JOBS.JOBF.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBF" -name "JAVA.API.JOBS.JOBF.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBI" -name "JAVA.API.JOBS.JOBI.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBI" -name "JAVA.API.JOBS.JOBI.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP" -name "JAVA.API.JOBP.JOBP.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP" -name "JAVA.API.JOBP.JOBP.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP_IF" -name "JAVA.API.JOBP.JOBP_IF.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP_IF" -name "JAVA.API.JOBP.JOBP_IF.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP_FOREACH" -name "JAVA.API.JOBP.JOBP_FOREACH.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JOBP_FOREACH" -name "JAVA.API.JOBP.JOBP_FOREACH.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA" -name "JAVA.API.VARA.VARA.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA" -name "JAVA.API.VARA.VARA.1" -folder "API.TESTS.TARGET"' 99

AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_FILELIST" -name "JAVA.API.VARA.VARA_FILELIST.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_FILELIST" -name "JAVA.API.VARA.VARA_FILELIST.1" -folder "API.TESTS.TARGET"' 99
 
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_MULTI" -name "JAVA.API.VARA.VARA_MULTI.1" -folder "API.TESTS.TARGET"' 0
AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_MULTI" -name "JAVA.API.VARA.VARA_MULTI.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SQL" -name "JAVA.API.VARA.VARA_SQL.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SQL" -name "JAVA.API.VARA.VARA_SQL.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SQLI" -name "JAVA.API.VARA.VARA_SQLI.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SQLI" -name "JAVA.API.VARA.VARA_SQLI.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SEC_SQL" -name "JAVA.API.VARA.VARA_SEC_SQL.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SEC_SQL" -name "JAVA.API.VARA.VARA_SEC_SQL.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SEC_SQLI" -name "JAVA.API.VARA.VARA_SEC_SQLI.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_SEC_SQLI" -name "JAVA.API.VARA.VARA_SEC_SQLI.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_BACKEND" -name "JAVA.API.VARA.VARA_BACKEND.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_BACKEND" -name "JAVA.API.VARA.VARA_BACKEND.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_EXEC" -name "JAVA.API.VARA.VARA_EXEC.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_EXEC" -name "JAVA.API.VARA.VARA_EXEC.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_XML" -name "JAVA.API.VARA.VARA_XML.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "VARA_XML" -name "JAVA.API.VARA.VARA_XML.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_CONS" -name "JAVA.API.EVNT.EVNT_CONS.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_CONS" -name "JAVA.API.EVNT.EVNT_CONS.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_FILE" -name "JAVA.API.EVNT.EVNT_FILE.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_FILE" -name "JAVA.API.EVNT.EVNT_FILE.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_TIME" -name "JAVA.API.EVNT.EVNT_TIME.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_TIME" -name "JAVA.API.EVNT.EVNT_TIME.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_DB" -name "JAVA.API.EVNT.EVNT_DB.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "EVNT_DB" -name "JAVA.API.EVNT.EVNT_DB.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CONN_SQL" -name "JAVA.API.CONN.CONN_SQL.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CONN_SQL" -name "JAVA.API.CONN.CONN_SQL.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CONN_DB" -name "JAVA.API.CONN.CONN_DB.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CONN_DB" -name "JAVA.API.CONN.CONN_DB.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL" -name "JAVA.API.CALL.CALL.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL" -name "JAVA.API.CALL.CALL.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_STANDARD" -name "JAVA.API.CALL.CALL_STANDARD.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_STANDARD" -name "JAVA.API.CALL.CALL_STANDARD.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_MAIL" -name "JAVA.API.CALL.CALL_MAIL.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_MAIL" -name "JAVA.API.CALL.CALL_MAIL.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_ALARM" -name "JAVA.API.CALL.CALL_ALARM.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALL_ALARM" -name "JAVA.API.CALL.CALL_ALARM.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JSCH" -name "JAVA.API.JSCH.JSCH.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "JSCH" -name "JAVA.API.JSCH.JSCH.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "FOLD" -name "JAVA.API.FOLD.FOLD.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "FOLD" -name "JAVA.API.FOLD.FOLD.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "LOGIN" -name "JAVA.API.LOGIN.LOGIN.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "LOGIN" -name "JAVA.API.LOGIN.LOGIN.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "PROMPT_SET" -name "JAVA.API.PROMPT_SET.PROMPT_SET.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "PROMPT_SET" -name "JAVA.API.PROMPT_SET.PROMPT_SET.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "QUEUE" -name "JAVA.API.QUEUE.QUEUE.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "QUEUE" -name "JAVA.API.QUEUE.QUEUE.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "USER" -name "JAVA.API.USER1/AUTOMIC" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "USER" -name "JAVA.API.USER1/AUTOMIC" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "USRG" -name "JAVA.API.USRGRP1/AUTOMIC" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "USRG" -name "JAVA.API.USRGRP1/AUTOMIC" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALE" -name "JAVA.API.CALE.CALE.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "CALE" -name "JAVA.API.CALE.CALE.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "SYNC" -name "JAVA.API.SYNC.SYNC.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "SYNC" -name "JAVA.API.SYNC.SYNC.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "HOSTG" -name "JAVA.API.HOSTG.HOSTG.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "HOSTG" -name "JAVA.API.HOSTG.HOSTG.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "SCRI" -name "JAVA.API.SCRI.SCRI.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "SCRI" -name "JAVA.API.SCRI.SCRI.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "DOCU" -name "JAVA.API.DOCU.DOCU.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "DOCU" -name "JAVA.API.DOCU.DOCU.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "FILTER_OUTPUT" -name "JAVA.API.FILTER_OUTPUT.FILTER_OUTPUT.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "FILTER_OUTPUT" -name "JAVA.API.FILTER_OUTPUT.FILTER_OUTPUT.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "PERIOD" -name "JAVA.API.PERIOD.PERIOD.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "PERIOD" -name "JAVA.API.PERIOD.PERIOD.1" -folder "API.TESTS.TARGET"' 99
 
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "STORE" -name "JAVA.API.STORE.STORE.1" -folder "API.TESTS.TARGET"' 0
 AddToATestCaseSuiteFull $JavaBin '-commit -check -template "STORE" -name "JAVA.API.STORE.STORE.1" -folder "API.TESTS.TARGET"' 99

Write-Host "Number of Test Cases Found: $($TestCaseArray.Count)"

foreach ($testcase in $TestCaseArray) {
  #Write-host $testcase.Command
  #Write-host $testcase.RetCodeExpected

  $Params = $($testcase.Command)
  $command = "$JAVACMD $($testcase.BinaryName) $AUTHPARAMS $Params"
  #Write-Host " %% Running Test: $command"
  $commandOutput = iex "& $command"
  $commandReturnCode = $lastExitCode

  $Status = CheckReturnCode $($testcase.RetCodeExpected) $commandReturnCode
  if(-Not($Status)){
  Write-Host " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
  write-Host " Output is: "
  echo $commandOutput
  }else{
  Write-Host " ++ Test OK: $($testcase.Command)."
  }
  
 }


cd $CurrentPath