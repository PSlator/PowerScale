$performanceThreadsMax = "15"                                                               #Maximum number of symaltaneous threads used for performance monitoring
$performanceIndividual = "Individual.xml"                                                   #Individual machine performance XML
$performanceOverAll = "Overall.xml"                                                         #Overall machine performance XML
$performanceScaling = $true                                                                 #Performance scaling to be turned on or off (true or false)
$citrixController = ""                                                                      #Citrix controller name or IP
$machineDetection = "prefix"                                                                #The machine detection method - can be tag based, delivery group, machine catalog or prefix, options prefix, tag, dg, mc (Support for multiple tags, delivery groups or machine catalogs)
$machinePrefix = "XDSH","XASH"                                                              #Machine name prefix to include
$machineDeliveryGroups = "Delivery Group 1","Delivery Group 2"                              #Machine delivery groups to target - add additional ones like this: $machineDeliveryGroups = "Delivery Group 1","Delivery Group 2"
$machineCatalogs = "Catalog 1","Catalog 2"                                                  #Machine catalogs groups to target - add addtional ones like this: $machineCatalogs = "Catalog 1","Catalog 2"
$machineTags = "powerGroup1","powerGroup2"                                                  #Machines tags to target - add addtional ones like this: $machineTags = "Tag 1","Tag 2"
$businessStartTime =  "06:00"                                                               #Start time of the business
$businessCloseTime = "18:00"                                                                #End time of the business
$outOfHoursMachines = "1"                                                                   #How many machines should be powered on during the weekends
$inHoursMachines = "1"                                                                      #How many machines should be powered on during the day (InsideOfHours will take into account further machines)
$machineScaling = "CPU"                                                                     #Options are (Schedule, CPU, Memory, Index or Session)
$farmCPUThreshhold = 85                                                                     #Farm CPU threshhold average ex: 90 = 90% CPU across the farm on average
$farmMemoryThreshhold = 85                                                                  #Farm memory threshhold average ex: 90 = 90% memory used across the farm on average
$farmIndexThreshhold = 5000                                                                 #Farm Load Index threshhold average ex: 5000 = Load index of 5000 on average across the farm
$farmSessionThreshhold = 12                                                                 #Farm Session threshhold average ex: 20 = An average of 20 users on each server
$dashboardBackupTime = "04:00"                                                              #The time that the Dashboard should be backed up and new one started
$dashboardRetention = 5                                                                     #How many Dashboard files should be retained
$scriptRunInterval = 15                                                                     #How often the script runs, used to find a window of time to backup the dashboard files
$LogNumberOfDays = 7                                                                        #Days to rotate the logs after
$logLocation = "Logs\PowerScale_Log.log"                                                    #Log file location
$forceUserLogoff = $true                                                                    #Force user sessions to be logged off out of hours or allow user sessions to drain
$userLogoffFirstInterval = "1"                                                              #Initial logoff message interval if forcing user logoff in minutes
$userLogoffFirstMessage = "This server will be shutdown outside of working hours, please save your work and logoff"   #Initial logoff message
$userLogoffSecondInterval = "1"                                                             #Second logoff message interval if forcing user logoff in minutes
$userLogoffSecondMessage = "This server will be shutdown shortly, please save your work and logoff as soon as possible"  #Second logoff message
$smtpServer = ""                                                                            #SMTP server address
$smtpToAddress = ""                                                                         #Email address to send to
$smtpFromAddress = ""                                                                       #Email address mails will come from
$smtpSubject = "PowerScale"                                                                 #Mail Subject (will be appended with Error if error
$testingOnly = $true                                                                        #Debugging value, will only write out to the log
$exclusionTag = "excluded"                                                                  #Tag in Studio to ensure a machine is discounted from calculations
$authServiceAccount = ""                                                                    #Authentication Service Account Name - must include UPN or domain\username
$authServicePassword = ""                                                                   #Authentication Service Account Password - leave empty if not required (!!!!Remove once this script is run!!!!)

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition -Verbose
$performanceindividualpath = $scriptpath+'\'+$performanceIndividual
$performanceoverallpath = $scriptpath+'\'+$performanceOverAll
$loglocationpath = $scriptpath+'\'+$logLocation

$configContent = [PSCustomObject]@{
    performanceThreadsMaxComment = "Maximum number of symaltaneous threads used for performance monitoring"
    performanceThreadsMax = $performanceThreadsMax
    performanceScriptLocationComment = "Performance gathering script location"
    performanceScriptLocation = $performanceScriptLocation
    performanceIndividual = $performanceIndividualpath 
    performanceIndividualComment = "Individual machine performance XML"
    performanceOverall = $performanceOverAllpath
    performanceOverallComment = "Overall machine performance XML"
    performanceScaling = $performanceScaling
    performanceScalingComment = "Performance scaling to be turned on or off (true or false)"
    citrixControllerComment = "Citrix controller name or IP"
    citrixController = $citrixController
    machineDetectionComment = "The machine detection method - can be tag based, delivery group, machine catalog or prefix, options prefix, tag, dg, mc (Support for multiple tags, delivery groups or machine catalogs)"
    machineDetection = $machineDetection
    machinePrefixComment = "Machine name prefix to include"
    machinePrefix = $machinePrefix
    machineDeliveryGroupsComment = 'Machine delivery groups to target - add additional ones like this: $machineDeliveryGroups = "Delivery Group 1","Delivery Group 2"'
    machineDeliveryGroups = $machineDeliveryGroups
    machineCatalogsComment = 'Machine catalogs groups to target - add addtional ones like this: $machineCatalogs = "Catalog 1","Catalog 2"'
    machineCatalogs = $machineCatalogs
    machineTagsComment = 'Machines tags to target - add addtional ones like this: $machineTags = "Tag 1","Tag 2"'
    machineTags = $machineTags
    businessStartTimeComment = "Start time of the business"
    businessStartTime =  $businessStartTime
    businessCloseTimeComment = "End time of the business"
    businessCloseTime = $businessCloseTime
    outOfHoursMachinesComment = "How many machines should be powered on during the weekends"
    outOfHoursMachines = $outOfHoursMachines
    inHoursMachinesComment = "How many machines should be powered on during the day (InsideOfHours will take into account further machines)"
    inHoursMachines = $inHoursMachines
    machineScalingComment = "Options are (CPU, Memory, Index or Sessions)"
    machineScaling = $machineScaling
    farmCPUThreshhold = $farmCPUThreshhold
    farmCPUThreshholdComment = "Farm CPU threshhold average ex: 90 = 90% CPU across the farm on average"
    farmMemoryThreshhold = $farmMemoryThreshhold
    farmMemoryThreshholdComment = "Farm memory threshhold average ex: 90 = 90% memory used across the farm on average"
    farmIndexThreshhold = $farmIndexThreshhold
    farmIndexThreshholdComment = "Farm Load Index threshhold average ex: 5000 = Load index of 5000 on average across the farm"
    farmSessionThreshhold = $farmSessionThreshhold
    farmSessionThreshholdComment = "Farm Session threshhold average ex: 20 = An average of 20 users on each server"
    dashboardBackupTime = $dashboardBackupTime
    dashboardBackupTimeComment = "The time that the Dashboard should be backed up and new one started"
    dashboardRetention = $dashboardRetention
    dashboardRetentionComment = "How many Dashboard files should be retained"
    scriptRunInterval = $scriptRunInterval
    scriptRunIntervalComment = "How often the script runs, used to find a window of time to backup the dashboard files"
    LogNumberOfDaysComment = "Days to rotate the logs after"
    LogNumberOfDays = $LogNumberOfDays
    logLocationComment = "Log file location"
    logLocation = $logLocationpath
    forceUserLogoffComment = "Force user sessions to be logged off out of hours or allow user sessions to drain"
    forceUserLogoff = $forceUserLogoff
    userLogoffFirstIntervalComment = "Initial logoff message interval if forcing user logoff in minutes"
    userLogoffFirstInterval = $userLogoffFirstInterval
    userLogoffFirstMessageComment = "Initial logoff message to user"
    userLogoffFirstMessage = $userLogoffFirstMessage
    userLogoffSecondIntervalComment = "Second logoff message interval if forcing user logoff in minutes"
    userLogoffSecondInterval = $userLogoffSecondInterval
    userLogoffSecondMessageComment = "Second logoff message to user"
    userLogoffSecondMessage = $userLogoffSecondMessage
    smtpServerComment = "SMTP server address"
    smtpServer = $smtpServer
    smtpToAddressComment = "Email address to send to"
    smtpToAddress = $smtpToAddress
    smtpFromAddressComment = "Email address mails will come from"
    smtpFromAddress = $smtpFromAddress
    smtpSubjectComment = "Mail Subject (will be appended with Error if error"
    smtpSubject = $smtpSubject
    exclusionTag = $exclusionTag
    exclusionTagComment = "Tag to assign in Studio to exclude a machine from scaling operations"
    authServiceAccount = $authServiceAccount
    authServiceAccountComment = "Authentication Service Account Name"
    testingOnlyComment = "Debugging value, will only write out to the log "
    testingOnly = $testingOnly
}

#Encrypt authentication user credentials if authPassword is populated
If ($authServicePassword) {
    # Define variables
    $Directory = split-path -parent $MyInvocation.MyCommand.Definition
    $KeyFile = Join-Path $Directory  "AES_KEY_FILE.key"
    $PasswordFile = Join-Path $Directory "AES_PASSWORD_FILE.pass"

    $Password = $authServicePassword

    #Remove previous password files if they exist
    if ($(Test-Path $KeyFile) -eq $true) {
        Remove-Item -Path $KeyFile -Force
    }

    if ($(Test-Path $PasswordFile) -eq $true) {
        Remove-Item -Path $PasswordFile -Force
    }

    # Create the AES key file
    try {
    $Key = New-Object Byte[] 32
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
    $Key | out-file $KeyFile
            $KeyFileCreated = $True
        Write-Output "The key file $KeyFile was created successfully"
    } catch {
        Write-Output "An error occurred trying to create the key file $KeyFile (error: $($Error[0])"
    }

    Start-Sleep 2

    # Add the plaintext password to the password file (and encrypt it based on the AES key file)
    If ( $KeyFileCreated -eq $True ) {
        try {
        $Key = Get-Content $KeyFile
            $encPassword = ConvertTo-SecureString $Password -AsPlainText -Force
            $encPassword | ConvertFrom-SecureString -key $Key | Out-File $PasswordFile
            Write-Output "The key file $PasswordFile was created successfully"
        } catch {
            Write-Output "An error occurred trying to create the password file $PasswordFile (error: $($Error[0])"
        }
    }
}

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition -Verbose
$configContent | Export-Clixml -Path "$scriptPath\config.xml" -Verbose
