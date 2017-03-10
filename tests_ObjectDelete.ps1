. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$TestCaseArray = @()
$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBjECTS_Delete.jar"

AddToATestCaseSuite "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -folder 'API.TESTS.TARGET' -f_incsub" 0
AddToATestCaseSuite "-commit -name '*' -f_name '.*UNIX.*' -folder 'API.TESTS.TARGET'" 0
AddToATestCaseSuite "-commit -name '*' -f_type 'JOBP' -folder 'API.TESTS.TARGET'" 0
AddToATestCaseSuite "-commit -name 'JAVA.API.*' -f_type '.+' -folder 'API.TESTS.TARGET' -f_incsub" 0

Write-Host "Number of Test Cases Found: $($TestCaseArray.Count)"

foreach ($testcase in $TestCaseArray) {
   #Write-host $testcase.Command
   #Write-host $testcase.RetCodeExpected

   $Params = $($testcase.Command)
   $command = "$JAVACMD $JavaBin $AUTHPARAMS $Params"
   #Write-Host " %% Running Test: $command"
   $commandOutput = iex "& $command"
   $commandReturnCode = $lastExitCode

   $Status = CheckReturnCode $($testcase.RetCodeExpected) $commandReturnCode
   if(-Not($Status)){
    Write-Host " -- Test Failed: $command - Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
    write-Host " Output is: "
    echo $commandOutput
   }else{
    Write-Host " ++ Test OK: $command"
    echo $commandOutput
   }
    
 }


cd $CurrentPath