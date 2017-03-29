. "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-QA-Tests\cli_lib.ps1"

$CurrentPath = $PSScriptRoot
cd $BINREPO

$JavaBin = "OBjECTS_Delete.jar"

AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.JOBS.JOBS_WIN.1' -folder 'API.TESTS.TARGET' -f_incsub" 0
AddToATestCaseSuiteFull $JavaBin "-commit -name '*' -f_name '.*UNIX.*' -folder 'API.TESTS.TARGET'" 0
AddToATestCaseSuiteFull $JavaBin "-commit -name '*' -f_type 'JOBP' -folder 'API.TESTS.TARGET'" 0
AddToATestCaseSuiteFull $JavaBin "-commit -name 'JAVA.API.*' -f_type '.+' -folder 'API.TESTS.TARGET' -f_incsub" 0

ShowTestCaseNumber $($TestCaseArray.Count)

MainProcessStart $TestCaseArray

cd $CurrentPath