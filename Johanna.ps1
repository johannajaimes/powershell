#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate("http://lmnapp75/BPMDDILP/");
#$ie.navigate("http://www.google.com");
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

$counter = 0
while (($counter -lt 100) -and ($ie.document -eq $null)) {Start-Sleep 1; $counter++}

$es = $ie.document.getElementsByTagName("*")
$n = $es.length;
for ($i=0;$i -lt $n; $i++) {

    "The following elementId was found: "
    $es[$i].id

    if ($es[$i].hasAttribute("contentWindow"))
    {
        "The following elementId has a contentWindow: "
        $es[$i].id
    }
}

($ie.document.getElementsByName("menuQuery")|select -first 1).value = "DD-4266-CV";

#$ie.document.getElementById("lst-ib").value = "sugar puppy";
while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

