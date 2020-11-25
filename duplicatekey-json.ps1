<#

.SYNOPSIS
  Detect Duplicate keys in JSON

.DESCRIPTION
  Detect Duplicate keys in JSON

.PARAMETER 
    None. This is a simple function

.INPUTS
  String with line breaks. 

.OUTPUTS
  Number, how many duplicate keys found  
    -1 = Not a valid JSON
	 0 = no duplicates 
	>0 = this many duplicates 

.NOTES
  Version:        1.0
  Author:         /u/gordonv
  Creation Date:  11/25/2020
  Purpose/Change: https://old.reddit.com/r/PowerShell/comments/k0r4r4/detecting_duplicate_object_property_inside_the/
  
.EXAMPLE
  $a = duplicatekey-json($string)
  More Examples at line 60 of this file.
#>

Function duplicatekey-json($string) {

	If ($string | test-json -ErrorAction Ignore) { 

		$level = 0 # this is to track how many bracket levels we are in
		$levelname=""
		$text = @() # this stores the JSON line by line
		
		foreach($line in $string) {
			
			$old_level=$level
			
			$level += ($line.Split('{')).count -1
			$level -= ($line.Split('}')).count -1
			
			$text += "$level + $levelname + $($line.Split(':')[0])"
			if ($old_level -lt $level) {$levelname = $line.Split(':')[0]}
			
		}
		
		$($text | Group-Object | where -property Count -GT 1).count # Return the count

	} else {return -1} # If test-json fails the string}

}

<# ------------

Example use cases

  ------------ #>

duplicatekey-json(gc "sample.json")  # File has duplicates
duplicatekey-json(gc "sample2.json") # File has no duplicates
duplicatekey-json("test")            # a simple string, will return -1 because test-json fails it.