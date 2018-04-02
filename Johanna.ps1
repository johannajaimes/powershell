#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

($ie.document.getElementsByName("menuQuery") |select -first 1).value = "DD-4266-CV";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

