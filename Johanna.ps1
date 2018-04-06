#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
#$ie.navigate("http://www.google.com");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

$counter = 0;
while (($counter -lt 100) -and ($ie.document -eq $null)) {Start-Sleep 1; $counter++}

document.querySelectorAll('*').forEach(function($node) {
    "The following node was found: ";
    $node;
    if ($node.hasAttribute("id")){"... and it has an id: ";$node.id};
    if ($node.hasAttribute("name")){"... and it has a name: ";$node.name};
    if ($node.hasAttribute("value")){"... and it has a value: "; $node.value};
    if ($node.hasAttribute("contentWindow")){"... and it has a contentWindow"};
});


($ie.document.getElementsByName("menuQuery")|select -first 1).click();
($ie.document.getElementsByName("menuQuery")|select -first 1).value = "DD-4266-CV";

#$ie.document.getElementById("lst-ib").value = "sugar puppy";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

