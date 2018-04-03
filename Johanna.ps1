#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
Start-Sleep -Seconds 20;
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
$ie.document.getElementById("menuQuery").value = "DD-4266-CV";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

