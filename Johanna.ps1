#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
$counter = 0;
while (($counter -lt 100) -and ($ie.Document -eq $null)) {Start-Sleep 1; $counter++}
If ($ie) {'$ie is nice'
If ($ie.Document) {'$ie.Document is nice'
If ($ie.Document.getElementById("menuQuery")) {'$ie.Document.getElementById("menuQuery") is nice'
If ($ie.Document.getElementById("menuQuery").value) {'$ie.Document.getElementById("menuQuery").value is nice'
}  Else {'$ie.Document.getElementById("menuQuery").value IS NOT NICE!'} 
}  Else {'$ie.Document.getElementById("menuQuery") IS NOT NICE!'} 
}  Else {'$ie.Document IS NOT NICE!'} 
}  Else {'$ie IS NOT NICE!'}
$ie.Document.getElementById("menuQuery");
$ie.Document.getElementById("menuQuery").click();
$ie.Document.getElementById("menuQuery").value = "DD-4266-CV";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

