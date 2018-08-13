Param(

    [Parameter(Mandatory = $True)]
    [ValidateNotNullOrEmpty()]
    [string] $SubscriptionId,
    
    [Parameter(Mandatory = $True)]
    [ValidateNotNullOrEmpty()]
    [string] $ResourceGroupName,

    [Parameter(Mandatory = $True)]
    [ValidateNotNullOrEmpty()]
    [string] $UserName,

    [Parameter(Mandatory = $True)]
    [ValidateNotNullOrEmpty()]
    [string] $Password
)

Write-Host "Logging in to Azure Rm Account"
$Psswd = $Password | ConvertTo-SecureString -asPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential($UserName,$Psswd)
Login-AzureRmAccount -Credential $Credential

Write-Host "Select Azure Subscription"

Select-AzureRmSubscription -SubscriptionId $SubscriptionId

Write-Host "Create the Resource Group"

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location 

Write-Host "Resource Group has been created Successfully"

