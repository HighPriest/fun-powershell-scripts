param(
    [Parameter(Mandatory=$false)]
    [string]$source_dir = "E:\Video\GoPro\1NewDump",
  
    [Parameter(Mandatory=$false)]
    [string]$target_dir = "C:\Video_Encode"
)

Write-Host "Source Directory: $source_dir"
Write-Host "Target Directory: $target_dir"

Get-ChildItem $target_dir *.mkv | ForEach-Object {
    Write-Host "$source_dir"$_.BaseName
    $_.LastWriteTime = (Get-Item ($source_dir+"\"+$_.BaseName+"*")).LastWriteTime
    $_.CreationTime = (Get-Item ($source_dir+"\"+$_.BaseName+"*")).CreationTime
    $_.CreationTimeUtc = (Get-Item ($source_dir+"\"+$_.BaseName+"*")).CreationTimeUtc
}