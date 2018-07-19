Function CreateArray {

    $computer_names = Get-ADGroupmember -Identity "CR Desktops" | select -expandproperty name
   
        return $computer_names
}

ForEach ($Desktop in CreateArray) {

    $Date = Get-Date -UFormat "%Y_%m_%d"
    $Filename = $Desktop + '   ' + $Date

            Invoke-Command -ComputerName $Desktop -ScriptBlock {defrag /U /O C:} >> "\\atrdc2\scripts\PowerShell\logs\Defrag-Logs\$Filename.txt"
            }