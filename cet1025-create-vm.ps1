# 
# Create Hyper-V Virtual Machine attached to Default Switch
# 
# Dave Cushing 2023-07-13
# 
# ./cet1025-create-vm.ps1
#
# * Must be run with Administrative privileges

# The Google Drive Identifier for Ubuntu-2204.zip file
$GoogleFileId = "1lvBfxTr04z8fIt1_0CMLOZBHprB41MME"

# Download to the Users Downloads folder (change if needed)
$DownloadFolder = "$env:USERPROFILE`\Downloads"

# Use Default Switch to connect VM to (change if needed)
$Switch = "Default Switch"

#Get the full path and name for the downloaded file (in case it is stored elsewhere)
$VHDBase = "$DownloadFolder\Ubuntu-2204.zip"
$VHDBase = Read-Host "Path to download .vhdx [$VHDBase]"
If ($VHDBase -eq "") { $VHDBase = "$DownloadFolder\Ubuntu-2204.zip" }
if (-not (Test-Path $VHDBase)) {
    Write-Host "$VHDBase does not exist. Downloading..."
    # set protocol to tls version 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # Download the Virus Warning into _tmp.txt and get the needed session variable
    Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=$GoogleFileId" -OutFile "_tmp.txt" -SessionVariable googleDriveSession
    # Delete _tmp.txt
    Remove-Item "_tmp.txt"

    # Download the Ubuntu-2204.zip file
    Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&confirm=${confirmCode}&id=$GoogleFileId" -OutFile $VHDBase -WebSession $googleDriveSession
    
}
else {
    # We alredy have the file - no need to download it again
    Write-Host "$VHDBase already exists continuing..."
}

# Set the name for the VM - must be unique
$VM = "CET1025-$env:USERNAME"
$VM = Read-Host "Name of Virtual Machine [$VM]"
If ($VM -eq "") { $VM = "CET1025-$env:USERNAME" }
if (Get-VM -Name $VM -ErrorAction SilentlyContinue) {
    Write-Host "Virtual machine '$VM' already exists. Delete and re-try." 
    Write-Host "Exiting the script."
    break
}

# Create the VM in the Users Documents folder (allow to change if wanted)
$VMPath = "$env:USERPROFILE\Documents\CET1025\$VM"
$VMPath = Read-Host "Path to Virtual Machine Files [$VMPath]"
If ($VMPath -eq "") { $VMPath = "$env:USERPROFILE\Documents\CET1025\$VM" }
if (-not (Test-Path $VMPath)) {
    New-Item -ItemType Directory -Path $VMPath | Out-Null
    Write-Host "Directory created: $VMPath"
}
else {
    Write-Host "Directory already exists: $VMPath"
}

#Expand the .zip file for the VM to use
#If it already exists, use the existing one
if (-not (Test-Path $VMPath\Ubuntu-2204.vhdx)) {
    Expand-Archive -Path $VHDBase -DestinationPath $VMPath
}
else {
    Write-Host "File already exists in destination: $VMPath\Ubuntu-2204.vhdx"
}
New-VM -Name $VM -MemoryStartupBytes 2GB -Path $VMPath -VHDPath $VMPath\Ubuntu-2204.vhdx -Generation 2 -SwitchName $Switch -BootDevice VHD
Set-VMFirmware -VMName $VM -EnableSecureBoot Off

# Create secondary disks for sgdisk and LVM (sdb-sdi)
for($disknum = 1; $disknum -le 8; $disknum++) {
    if (-not (Test-Path $VMPath`\Disk$disknum.vhdx)) {
        New-VHD -Path $VMPath`\Disk$disknum.vhdx -Dynamic -SizeBytes 1GB
        Add-VMHardDiskDrive -VMName $VM -Path $VMPath`\Disk$disknum.vhdx
        Write-Host "File created: $VMPath`\Disk$disknum.vhdx"
    }
    else {
        Write-Host "File already exists: $VMPath`\Disk$disknum.vhdx"
        Add-VMHardDiskDrive -VMName $VM -Path $VMPath`\Disk$disknum.vhdx
    }
}
