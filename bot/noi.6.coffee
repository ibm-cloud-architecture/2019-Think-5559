
	robot.hear /noi pull (.*)/i, (msg) ->
		sql = "update alerts.status set Slack = 1 where Serial = " + msg.match[1]
		omnibusConnection.sqlCommand  sql, (err, rows, numrows, coldesc) ->
			console.log "Err : " + err
				if numrows is 1
					msg.send "Bringing the event here."
				else
					msg.send "Could not recover the event #" + msg.match[1] + " from NOI"
