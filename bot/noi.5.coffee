	
	robot.hear /noi show (.*)/i, (msg) ->
		query = 'SELECT Serial, Summary, Severity, Node, Acknowledged, LastOccurrence from alerts.status where Serial=' +  msg.match[1]
		omnibusConnection.query query, (err, rows, numrows, coldesc) ->
			console.log err
			i = 0
			msg.send 
				text : rows[i].Summary
				attachments: [ {
					title: 'Node'
					text: rows[i].Node
					fields: [ {
						short : true
						title : 'Severity'
						value : rows[i].Severity
					},{
						title : 'Acknowledged'
						value : rows[i].Acknowledged
						short : true
					},{
						title : 'LastOccurrence'
						value : rows[i].LastOccurrence
						short : true
					},{
						title : 'Serial'
						value : rows[i].Serial
						short : true
					} ]
				} ]
				username: process.env.HUBOT_SLACK_BOTNAME
				as_user: true
				
