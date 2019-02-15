
	robot.hear /noi sev (\d) (.*)/i, (msg) ->
		sql = 'UPDATE alerts.status set Severity = ' + msg.match[1] + '  where Serial=' +  msg.match[2]
		omnibusConnection.sqlCommand sql, (err, rows, numrows, coldesc) ->
			console.log "Err=" + err
			if numrows == 0
				msg.send "I can't find any event with a serial number of " +  msg.match[2]
				msg.send "Perhaps the event has been closed already? Otherwise, try another serial number."
			else
				msg.send "The event severity has been set to " + msg.match[1]
