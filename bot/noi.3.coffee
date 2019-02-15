
	robot.hear /noi resolve (.*)/i, (msg) ->
		sql = 'UPDATE alerts.status set Severity = 0,CASE_ICD_Status=\'RESOLVED\'  where Serial=' +  msg.match[1]
		omnibusConnection.sqlCommand sql, (err, rows, numrows, coldesc) ->
			console.log "Err=" + err
			msg.send "Event resolved (Severity set to 0)"
