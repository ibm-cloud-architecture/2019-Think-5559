console.log ('Omnibus = ' + process.env.HUBOT_OMNIBUS_HOST)

omnibus = require('node-omnibus')
request = require('request')
HubotSlack = require 'hubot-slack'

noiChannelName = ""
omnibusConnection = omnibus.createConnection(
	host: process.env.HUBOT_OMNIBUS_HOST
	port: '8080'
	user: process.env.HUBOT_OMNIBUS_USER
	password: process.env.HUBOT_OMNIBUS_PASSWORD)

module.exports = (robot) ->

	robot.hear /noi ack (.*)/i, (msg) ->
		sql = 'UPDATE alerts.status set Acknowledged = 1 where Serial=' +  msg.match[1]
		omnibusConnection.sqlCommand sql, (err, rows, numrows, coldesc) ->
			console.log "err:" + err
			if numrows == 0
				msg.send "I can't find any event with a serial number of " +  msg.match[1]
				msg.send "Perhaps the event has been closed already? Otherwise, try another serial number."
			else
				msg.send "Event acknowledged"      
			
	robot.hear /noi deack (.*)/i, (msg) ->
		sql = 'UPDATE alerts.status set Acknowledged = 0 where Serial=' +  msg.match[1]
		omnibusConnection.sqlCommand sql, (err, rows, numrows, coldesc) ->
			console.log "err:" + err
			if numrows == 0
				msg.send "I can't find any event with a serial number of " +  msg.match[1]
				msg.send "Perhaps the event has been closed already? Otherwise, try another serial number."
			else
				msg.send "Event de-acknowledged"

