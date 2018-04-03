#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
#$ie.navigate("http://lmnapp75/BPMDDILP/");
$ie.navigate("http://www.google.com");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
#$ie.document.getElementById("menuQuery").value = "DD-4266-CV";
$ie.document.getElementById("lst-ib").value = "sugar puppy";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

