
$JAVACMD = "java -jar"
$AUTHPARAMS = "-C 100 -L ARA -D ARA -W ARA -H AETestHost"
$BINREPO = "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-Repository"

$Global:TestCaseArray = @()

function AddToATestCaseSuiteFullWithKeywordChecks
{
 $Binary = $args[0]
 $Cmd = $args[1]
 $Ret = $args[2]
 $Keywords = $args[3]
 $NegKeywords = $args[4]
 $myObject = New-Object System.Object
 $myObject | Add-Member -type NoteProperty -name BinaryName -Value $Binary
 $myObject | Add-Member -type NoteProperty -name Command -Value $Cmd
 $myObject | Add-Member -type NoteProperty -name RetCodeExpected -Value $Ret
 $myObject | Add-Member -type NoteProperty -name KeywordsExpected -Value $Keywords
 $myObject | Add-Member -type NoteProperty -name KeywordsExcluded -Value $NegKeywords
 $Global:TestCaseArray += $myObject
 #$global:TestCaseArray =  $global:TestCaseArray + $myObject
 #return $myObject
}

function AddToATestCaseSuiteFull
{
 $Binary = $args[0]
 $Cmd = $args[1]
 $Ret = $args[2]
 $myObject = New-Object System.Object
 $myObject | Add-Member -type NoteProperty -name BinaryName -Value $Binary
 $myObject | Add-Member -type NoteProperty -name Command -Value $Cmd
 $myObject | Add-Member -type NoteProperty -name RetCodeExpected -Value $Ret
  #$global:TestCaseArray = $global:TestCaseArray + $myObject
  $Global:TestCaseArray += $myObject
 #return $myObject
}

function AddToATestCaseSuite
{
 $Cmd = $args[0]
 $Ret = $args[1]
 $myObject = New-Object System.Object
 $myObject | Add-Member -type NoteProperty -name Command -Value $Cmd
 $myObject | Add-Member -type NoteProperty -name RetCodeExpected -Value $Ret
  #$global:TestCaseArray = $global:TestCaseArray + $myObject
  $Global:TestCaseArray += $myObject
 #return $myObject
}

function CheckReturnCode
{
 $ExpectedCode = $args[0]
 $ActualCode = $args[1]
 if($ExpectedCode -eq $ActualCode){
    return $true
 }else{
   return $false
 }

}

function CheckOutputForKeywords
{
 $Keywords = $args[0]
 $Output = $args[1]

 #write-host $Output
 $GLOBAL = $true
 $Keywords.Split(",") | ForEach {
 #write-host "Testing token: $_"
 $FOUND =Select-String -inputObject $Output -Quiet "$_" 
    if(-Not($FOUND)){
        $GLOBAL = $false
       }
 }
 return $GLOBAL
}

function CheckOutputForKeywordsReverse
{
 $Keywords = $args[0]
 $Output = $args[1]

 #write-host $Output
 $GLOBAL = $true
 $Keywords.Split(",") | ForEach {
 #write-host "Testing token: $_"
 $FOUND =Select-String -inputObject $Output -Quiet "$_" 
    if($FOUND){
        $GLOBAL = $false
       }
 }
 return $GLOBAL
}

function ShowTestCaseNumber
{
 $Count = $args[0]
 Write-Host "Number of Test Cases Found: $Count"
}

function ShowCommand
{
 $command = $args[0]
 Write-Host " %% Running Test: $command"
}

function ShowOKMsg
{
 $Command = $args[0]
 Write-Host " ++ Test OK: $Command."
}

function ShowKOMsgRETCODE
{
 $Command = $args[0]
 $RetCodeExpected = $args[1]
 $RetCodeActual = $args[2]
 $Host.UI.WriteErrorLine(" -- Test Failed: $Command. Expected: $RetCodeExpected Found: $RetCodeActual")
 #Write-Error " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
}

function ShowKOMsgKWExpected
{
 $KeywordsExpected = $args[0]

 $Host.UI.WriteErrorLine(" -- Test Failed on Log Check. Not Found: [ $KeywordsExpected]")
 #Write-Error " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
}

function ShowKOMsgKWUnexpected
{
 $KeywordsUnexpected = $args[0]

 $Host.UI.WriteErrorLine(" -- Test Failed on Log Check. Found: [ $KeywordsUnexpected]")
 #Write-Error " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
}

function MainProcessStart
{
$TestCaseArray = $args[0]


foreach ($testcase in $TestCaseArray) {
  #Write-host $testcase.Command
  #Write-host $testcase.RetCodeExpected

  $Params = $($testcase.Command)
  $command = "$JAVACMD $($testcase.BinaryName) $AUTHPARAMS $Params"

  ShowCommand $command

  $commandOutput = iex "& $command"
  $commandReturnCode = $lastExitCode

  #echo $commandOutput

  $Status = CheckReturnCode $($testcase.RetCodeExpected) $commandReturnCode

  if(-Not($Status)){
  ShowKOMsgRETCODE $($testcase.Command) $($testcase.RetCodeExpected) $commandReturnCode

  #Write-Host " -- Test Failed: $($testcase.Command). Expected: $($testcase.RetCodeExpected) Found: $commandReturnCode "
  #write-Host " Output is: "
 
  }else{

      $ErrorFound = $false
      if($($testcase.KeywordsExpected)){
        
        $LogCheck = CheckOutputForKeywords $($testcase.KeywordsExpected) $commandOutput
        if(-Not($LogCheck)){
            ShowKOMsgKWExpected $($testcase.KeywordsExpected)
            #Write-Host " -- Test Failed on Log Check. Not Found: [$($testcase.KeywordsExpected)]"
            $ErrorFound = $true
        }else{
            #Write-Host " ++ Test OK: $($testcase.Command)."
        }
       }
      if($($testcase.KeywordsExcluded)){
        $LogCheck = CheckOutputForKeywordsReverse $($testcase.KeywordsExcluded) $commandOutput
        if(-Not($LogCheck)){
            ShowKOMsgKWUnexpected $($testcase.KeywordsExcluded)
            #Write-Host " -- Test Failed on Log Check. Found: [$($testcase.KeywordsExcluded)]"
            $ErrorFound = $true
        }else{
            #Write-Host " ++ Test OK: $($testcase.Command)."
        }
       }

       if(-Not($ErrorFound)){
       ShowOKMsg $($testcase.Command)
        #Write-Host " ++ Test OK: $($testcase.Command)."
        #echo $commandOutput
      }
  }
  
 }
}