# this script should be located on the Windows Host in directory C:\SandboxScripts

# Serial Package List
$PrePackages = @(
    "powershell-core"
)

# Parallel package list. Multiple items within nested arrays will be installed serially
#    @("docker-cli"),    @("firefox"),    @("procexp"),    @("conemu"),    @("notepadplusplus")
$Packages = @(
    @("linqpad"),
    @("vscode",	"vscode-powershell"),
    @("git"),
    @("nodejs")
)
Write-Verbose "Starting stopwatch..." -Verbose
$Timer = [System.Diagnostics.Stopwatch]::StartNew()

# This fixes an issue with the extended type system wrapping the array entries with Value and Count properties.
# Required for interoperability with 5.1 and 7
# See https://stackoverflow.com/questions/20848507
Remove-TypeData System.Array

Set-ExecutionPolicy Bypass -Scope Process -Force
# Engages TLS 1.2, required for chocolatey
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install the initial package (PS7) so we can run Foreach-Object in parallel...
foreach ($pkg in $PrePackages)
{
    cinst $pkg -y
}
# Ensure the path environment variable is up to date
refreshenv

# These are run in parallel
$7Script = {
    param(
        # A Json string of an array of an array of strings (object[string[]])
        [string]
        $Packages)
    # Restore the string back to the array
    $PackageObject = $Packages | ConvertFrom-Json
    Write-Debug -Message ($PackageObject | ConvertTo-Json) -Verbose
    $PackageObject | ForEach-Object -Parallel {
        $sw = [System.Diagnostics.Stopwatch]::StartNew()
        Foreach ($p in $_)
        {
            cinst $p -y --no-progress
        }
        "Installation of $($_ -join ",") completed in $($sw.Elapsed.Tostring())" | Out-File -FilePath "$env:UserProfile\Desktop\timings.log" -Force -Append
     } -ThrottleLimit 2
}

$FilePath = (resolve-path "C:\Program Files\PowerShell\*\pwsh.exe").Path
$PackageJson = ($Packages) | ConvertTo-Json
& $FilePath -noprofile -nologo -command $7Script -args $PackageJson


Write-Verbose "Script completed in $(($Timer.Elapsed).ToString("hh\hmm\mss\s").TrimStart("00h").TrimStart("00m"))" -Verbose
Start-Sleep -Seconds 30