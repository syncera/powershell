<#
.SYNOPSIS
    This script was designed to scan two serfers, then the whole subnet using nmap. #>
  
$weekday (get-date).DayOfWeek
$dc1 = "10.10.10.254"
$kdc = "10.10.10.253"
$subnet = "10.10.10.0/23"

if ($weekday -eq 'Monday') { # Scan the main DC on mondays
  try { nmap $dc1
  }
}
elseif ($weekday -eq 'Wednesday') { # Scan the radius server on wednesdays
  try { nmap $kdc
  }
}
else {
  try { nmap $subnet # Scan the whole subnet
}
  catch {
    "An error occurred."
  }
}
