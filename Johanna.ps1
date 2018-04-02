#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate($loginUrl);
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

#login
($ie.document.getElementsByName("username") |select -first 1).value = $username;
($ie.document.getElementsByName("password") |select -first 1).value = $password;
($ie.document.getElementsByName("login") |select -first 1).click();
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

