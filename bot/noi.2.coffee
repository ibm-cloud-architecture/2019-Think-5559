	robot.hear /noi journal (.*?) (.*)/i, (msg) ->
			dt = Date.now()
			dt = dt / 1000
			sql = 'Insert into alerts.journal (KeyField, Serial, UID, Chrono, Text1) values (\'' + msg.match[1] + '_' + dt + '\',' + msg.match[1] + ', 10000 ,' + dt + ', \'' + msg.match[2] + '\')'
			console.log sql
			omnibusConnection.sqlCommand sql, (err, rows, numrows, coldesc) ->
				console.log "Err=" + err
				msg.send "Journal entry added"
