param( 
    [Parameter(Mandatory=$true)] 
    [string] 
    $Url, 
    [Parameter(Mandatory=$true)] 
    [string] 
    $ServiceName,  
    [Parameter(Mandatory=$true)] 
    [string] 
    $SourcePage,  
    [Parameter(Mandatory=$true)] 
    [string] 
    $DestPage 
) 
 
 
function ClonePageWithWebPart($sourcePage, $destPage) 
{ 
    write-host "Criando página $destPage... " -nonewline  
    $url = $Url+"/_vti_bin/_vti_aut/author.dll" 
     
    $parameters = "method=move+document%3a15%2e0%2e0%2e4569&service%5fname=$([System.Web.HttpUtility]::UrlEncode($ServiceName))&oldUrl=$([System.Web.HttpUtility]::UrlEncode($sourcePage))&newUrl=$([System.Web.HttpUtility]::UrlEncode($destPage))&url%5flist=%5b%5d&rename%5foption=nochangeall&put%5foption=edit&docopy=true" 
 
    $http_request = New-Object -ComObject Msxml2.XMLHTTP 
    $http_request.open('POST', $url, $false) 
    $http_request.setRequestHeader("Content-type",  
      "application/x-www-form-urlencoded") 
     
    $http_request.setRequestHeader("X-Vermeer-Content-Type", "application/x-www-form-urlencoded") 
    $http_request.send($parameters) 
    $code = $http_request.status 
    $texto = $http_request.responseText 
     
    write-host "OK" -foregroundcolor green 
     
 
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($http_request) 
 
    return @{"code"=$code; "html"=$texto}                 
} 
 
ClonePageWithWebPart $SourcePage $DestPage