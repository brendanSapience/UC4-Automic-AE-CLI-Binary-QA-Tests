
$JAVACMD = "java -jar"
$AUTHPARAMS = "-C 100 -L ARA -D ARA -W ARA -H AETestHost"
$BINREPO = "C:\Users\brend\Documents\git\work\UC4-Automic-AE-CLI-Binary-Repository"

function AddToATestCaseSuiteFull
{
 $Binary = $args[0]
 $Cmd = $args[1]
 $Ret = $args[2]
 $myObject = New-Object System.Object
 $myObject | Add-Member -type NoteProperty -name BinaryName -Value $Binary
 $myObject | Add-Member -type NoteProperty -name Command -Value $Cmd
 $myObject | Add-Member -type NoteProperty -name RetCodeExpected -Value $Ret
  $global:TestCaseArray += $myObject
 #return $myObject
}

function AddToATestCaseSuite
{
 $Cmd = $args[0]
 $Ret = $args[1]
 $myObject = New-Object System.Object
 $myObject | Add-Member -type NoteProperty -name Command -Value $Cmd
 $myObject | Add-Member -type NoteProperty -name RetCodeExpected -Value $Ret
  $global:TestCaseArray += $myObject
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