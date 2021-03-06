function New-AceUser
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]
        $Uri,

        [Parameter(Mandatory)]
        [string]
        $ApiKey,

        [Parameter(Mandatory)]
        [string]
        $Thumbprint,

        [Parameter(Mandatory)]
        [string]
        $UserName,
        
        [Parameter()]
        [string]
        $FirstName = $null,

        [Parameter()]
        [string]
        $LastName = $null,

        [Parameter()]
        [bool]
        $IsAdmin = $false
    )

    $body = @{
        UserName = $UserName
        FirstName = $FirstName
        LastName = $LastName
        IsAdmin = $IsAdmin
    }

    try 
    {
        $result = Invoke-AceWebRequest -Method Post -Uri "$($Uri)/ace/user" -Body (ConvertTo-Json $body -Compress) -ContentType application/json -ApiKey $ApiKey -Thumbprint $Thumbprint
        Write-Output ($result | ConvertFrom-Json)        
    }
    catch 
    {
        
    }
}