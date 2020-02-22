<#
.SYNOPSIS
    This script is designed to perform a reverse DNS lookup on all of the hosts in a specified range. #>

$net = "10.10.10."
for ($hst = 0; $hst -lt 256; $hst++) {
  $ip = $net + $hst
  try {
    nslookup $ip
  }
  catch {
    "An error occurred."
  }
}
