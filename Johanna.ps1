$url = "http://lmnapp75/BPMDDILP/"


Write-Host "mike1"

Function ResetTimer
{
    $script:startTime = [DateTime]::Now
}
Write-Host "mike2"

Function IsTimeout([TimeSpan]$timeout)
{
    return ([DateTime]::Now - $startTime) -ge $timeout
}
Write-Host "mike3"

Function WaitForIE
{
    $ie = $script:ie
    Write-Debug "Waiting..."
    ResetTimer
    do {
        if (IsTimeout ([TimeSpan]::FromSeconds(30))) {
            Write-Error "IE response timed out."; ExitFailure
        }
        Start-Sleep -m 100
    }
    until ( $ie.ReadyState -eq 4 -and
            $ie.Document.readyState -eq 'complete')
}
Write-Host "mike4"

# Use this function to run JavaScript on a web page. Your $jsCommand can
# return a value which will be returned by this function unless $global
# switch is specified in which case $jsCommand will be executed in global
# scope and cannot return a value. If you received error 80020101 it means
# you need to fix your JavaScript code.
Function ExecJavaScript($ie, $jsCommand, [switch]$global)
{
    if (!$global) {
        $jsCommand = "document.body.setAttribute('PSResult', (function(){$jsCommand})());"
    }
    WaitForIE
    $document = $ie.document
    $window = $document.parentWindow
    $window.execScript($jsCommand, 'javascript') | Out-Null
    if (!$global) {
        return $document.body.getAttribute('PSResult')
    }
}
Write-Host "mike5"

Function CheckJQueryExists
{
    $result = ExecJavaScript $ie 'return window.hasOwnProperty("$");'
    return ($result -eq $true)
}
Write-Host "mike6"


$ie = New-Object -COM InternetExplorer.Application -Property @{
    Navigate = $url
    Visible = $true
}
Write-Host "mike7"


do { Start-Sleep -m 1000 } while ( $ie.ReadyState -ne 4 )
Write-Host "mike8"

$jQueryExists = CheckJQueryExists $ie
echo "jQuery exists? $jQueryExists"
Write-Host "mike9"


# make a jQuery call
ExecJavaScript $ie @'
    window.alert("Hello world!");
    var w = window;
    var i = 1;
    while (w != window.parent) {window.alert("hi baby "+i);i = i + 1;w = w.parent();}
    $('#menuQuery').val("DD-4266-CV");
    var content = $('#menuQuery').val();
    return content.text();
'@
Write-Host "mike10"


# Quit and dispose IE COM
#$ie.Quit()
#[System.Runtime.Interopservices.Marshal]::ReleaseComObject($ie) | out-null
#Remove-Variable ie

#$ie.Document.getElementById("menuQuery");
#$ie.Document.getElementById("menuQuery").click();
#while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle
#$ie.Document.getElementById("menuQuery").value = "DD-4266-CV";
#while ($ie.Busy -eq $true) { Start-Sleep -Seconds 1; }    #wait for browser idle

