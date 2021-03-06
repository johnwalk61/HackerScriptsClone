<#
.SYNOPSIS
     PowerShell version "smack_my_bitch_up.py"
.NOTES
     Created on:   	11/25/2015 12:28 PM
     Created by:   	Kevin Elwell
     Filename:     	WorkingLate.ps1
     FileVersion:   1.2

.DESCRIPTION
     PowerShell version "smack_my_bitch_up.py" script. Generates random person, asskissing and reasons to be sent via SMS.
     Currently the script outputs to the console.

.LINK
     Credit: Alex Jumašev @ www.jitbit.com
     Reference: https://www.jitbit.com/alexblog/249-now-thats-what-i-call-a-hacker/

.TODO
     Add SMS functionality via API (looking into free SMS API')
     Add logic to detect if I am logged into server/workstation xxxxxxx by getting the user context explorer.exe is running under.
     If it is my user context, the time is after 6:00pm EST and it is NOT a Saturday or Sunday, send the SMS message.
     Logging function is available for use.
#>



#region Application Variables
#----------------------------------------------
#----------- Begin Variables ------------------
#----------------------------------------------

# Define some variables
$AppName ="WorkingLate" 
$logPath = "$env:windir\Logs\$AppName"
$logfile = "$AppName.log"
$today = Get-Date
$dayofweek = $today.DayOfWeek.ToString()
$hourofday = $today.Hour.ToString()

#----------------------------------------------
#------------- End Variables ------------------
#----------------------------------------------
#endregion Application Variables



#region Application Functions
#----------------------------------------------
#------------- Begin Functions ----------------
#----------------------------------------------

# Logging function
Function Log([string]$logmessage)
{
    if (!(test-path $logPath)) 
    {
    
        New-Item $LogPath -type directory
    
        "[" + (Get-Date).ToString()+ "]" + " - " + $logmessage | out-file -Filepath $LogPath\$logfile -append 
    
    }else{
    
        "[" + (Get-Date).ToString()+ "]" + " - " + $logmessage | out-file -Filepath $LogPath\$logfile -append 
    }
}

#----------------------------------------------
#--------------- End Functions ----------------
#----------------------------------------------



#region
#------------------------------------------------
#-------------- Begin Arrays --------------------
#------------------------------------------------

# Array of names
$personarray = @("mike","Steve","dave","Paul","Phil","Kevin","Sam","Alex","Andrew","my boss","my Director","my co-worker")

# Pull a random name
$person = Get-Random -InputObject $personarray

# Array of ass kissing
$asskissingarray = @("love you!","so sorry.","I will call you when i leave.")

# Pull a random ass kissing statement
$asskissing = Get-Random -InputObject $asskissingarray

# Array of reasons
$reasonarray = @("working on some important code.","my manager volunteered me for something.","got pulled into a meeting.","helping $person. Again!","$person messed up a deployment. I am helping troubleshoot the issue.","$person asked me for some help.")

# Pull a random reason
$reason = Get-Random -InputObject $reasonarray

#------------------------------------------------
#---------------- End Arrays --------------------
#------------------------------------------------
#endregion



#region Validation
#------------------------------------------------
#-------------- Begin Validations ---------------
#------------------------------------------------

# Validate the day is NOT Saturday or Sunday
If($dayofweek -ne "Saturday" -or $dayofweek -ne "Sunday") {
    
    # Validate the hour is greater than or equal to 18 (6:00PM)
    If($hourofday -ge "18") {
    $ok2send = $true
  }
}

# If its not Saturday or Sunday and it is past 6:00PM, send the SMS message
If($ok2send) {

#///////////////////////////////////////////////////////
# This is where you will change the logic to send the SMS
# instead of outputing to the console.
#///////////////////////////////////////////////////////
# Output to console
write-host "Working late, $reason $asskissing"

#///////////////////////////////////////////////////////
#///////////////////////////////////////////////////////

}

#------------------------------------------------
#--------------- End Validations ----------------
#------------------------------------------------
#endregion Validation

