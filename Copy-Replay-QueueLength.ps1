$emailBody = "<html><body>"
$emailBody += "<h2>Exchange Database Replikasyon Durumu</h2>"
$emailBody += "<table border='1' cellpadding='5' cellspacing='0'>"
$emailBody += "<tr><th>Database</th><th>CopyQueueLength</th><th>ReplayQueueLength</th></tr>"

$allDBCopies | ForEach-Object {
    $dbName = $_.Name
    $copyQueueLength = $_.CopyQueueLength
    $replayQueueLength = $_.ReplayQueueLength
    $emailBody += "<tr>"
    $emailBody += "<td>$dbName</td>"
    $emailBody += "<td>$copyQueueLength</td>"
    $emailBody += "<td>$replayQueueLength</td>"
    $emailBody += "</tr>"
}

$emailBody += "</table></body></html>"

$from = "gonderen@domain.com"
$to = "alici@domain.com"
$subject = "Exchange Database Replikasyon Durumu"
$smtpServer = "smtp.sunucu.com"


Send-MailMessage -From $from -To $to -Subject $subject -Body $emailBody -SmtpServer $smtpServer -BodyAsHtml