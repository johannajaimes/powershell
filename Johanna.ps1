#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate($loginUrl);
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

#login
($ie.document.getElementsByName("menuQuery") |select -first 1).value = "DD-4266-CV";
($ie.document.getElementsByName("blahblahblah") |select -first 1).click();
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

