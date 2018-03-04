$CSVs = Get-ChildItem . | ?{$_.Extension -eq ".csv"}

write-host "tilt,bearing,global energy,diffuse energy,tilted energy"
foreach ($csv in $CSVs) {
$filename = $csv.name
$file = Import-Csv $filename

$tenergy = 0
$genergy = 0
$denergy = 0
foreach ($item in $file) {
$tenergy += $item.'Tilted Irr.'
$genergy += $item.'Global Irr.'
$denergy += $item.'Diffuse Irr.'
}
write-host "$($filename.Substring(4,2)),$($filename.Substring(12,2)),$genergy,$denergy,$tenergy"

}