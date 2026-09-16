$c = Get-Content '.\index.html' -Raw

# Get the socials div specifically
$start = $c.IndexOf('footer__socials', [System.StringComparison]::OrdinalIgnoreCase)
$start = [Math]::Max(0, $start - 30)

# Find the closing of socials section - look for footer__row-logo which comes right after
$end = $c.IndexOf('footer__row-logo', [System.StringComparison]::OrdinalIgnoreCase)
$end = $end + 50

$section = $c.Substring($start, $end - $start)

# Write to file for easy viewing
$section | Set-Content '.\socials_section.txt' -Encoding UTF8
Write-Host "Section length: $($section.Length)"
Write-Host "Start position: $start"
Write-Host "End position: $end"

# Also find individual social link start positions
$pos = $start
$linkCount = 0
while ($true) {
    $idx = $c.IndexOf('single-social', $pos, [System.StringComparison]::OrdinalIgnoreCase)
    if ($idx -lt 0 -or $idx -gt $end) { break }
    $linkCount++
    $linkStart = $c.LastIndexOf('<a', $idx)
    $context = $c.Substring($linkStart, [Math]::Min(200, $end - $linkStart))
    Write-Host "`nSocial link #$linkCount at position $linkStart :"
    Write-Host $context
    $pos = $idx + 1
}
Write-Host "`nTotal social links found: $linkCount"
