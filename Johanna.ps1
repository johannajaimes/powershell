#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
#$ie.navigate("http://www.google.com");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

$counter = 0
while (($counter -lt 100) -and ($ie.document -eq $null)) {Start-Sleep 1; $counter++}



If ($ie) {'$ie is nice'
If ($ie.document) {'$ie.document is nice'
If ($ie.document.getElementById("menuQuery")) {'$ie.document.getElementById("menuQuery") is nice'
If ($ie.document.getElementById("menuQuery").value) {'$ie.document.getElementById("menuQuery").value is nice'
}  Else {'$ie.document.getElementById("menuQuery").value IS NOT NICE!'} 
}  Else {'$ie.document.getElementById("menuQuery") IS NOT NICE!'} 
}  Else {'$ie.document IS NOT NICE!'} 
}  Else {'$ie IS NOT NICE!'} 

$ie.document.getElementById("menuQuery").value = "DD-4266-CV";

#$ie.document.getElementById("lst-ib").value = "sugar puppy";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

