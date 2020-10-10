Set-StrictMode -Version 3.0
# Example of a simple variable
$thisstr = 'This is a string.'

# Example of a list or array
$thislist = 1, 2, 3, 4
$numlist = 5.6, 4.5, 3.3, 13.2, 4.0, 34.33, 34.0, 45.45, 99.993, 11123
$beerlist = 99..1

# Example of a `Hash Table` or `Dictionary`
$staffdata = @{
    "JOHN" = 'Instructor'
    "CARINA" = 'TA'
    "JEFF" = 'TA'
    "ANDREW" = 'TA'
    "BRENT" = 'TA'
}

Write-Host 'After each prompt, type the answer and press the <Enter> key.'
$yourname = Read-Host -Prompt 'Type a first and last name'
$nameup = Read-Host -Prompt 'Print the names in all upper case (Y/n)?'
if(($nameup).ToUpper() -like "N*") {
    Write-Host 'Your name as entered is:  ' $yourname
}
else {
    $yourname = $yourname.ToUpper()
    Write-Host 'Your name in all upper case is:  ' $yourname
}

$beer1 = " bottles of beer on the wall.  "
$beer2 = " bottles of beer....  Take one down, pass it around, "
$beer3 = " bottle of beer on the wall.  "
$beer4 = " bottle of beer....  Take one down, pass it around, "
foreach($beer in $beerlist) {
    if($beer -ne 99) {
	if($beer -eq 1) {
            Write-Host $beer $beer3
	}
	else {
            Write-Host $beer $beer1
	}
    }
    Write-Host
    Write-Host $yourname " sings:"
    if($beer -eq 1) {
      Write-Host $beer $beer3
      Write-Host $beer $beer4
    }
    else {
      Write-Host $beer $beer1
      Write-Host $beer $beer2
    }
}
Write-Host
Write-Host $yourname " sadly sings:"
Write-Host "No more" $beer1 "Time to go home."
