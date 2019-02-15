alter table alerts.status add Slack integer;
go
insert into alerts.conversions values ('Slack0', 'Slack', 0, 'Not Sent');
go
insert into alerts.conversions values ('Slack1', 'Slack', 1, 'Queued');
go
insert into alerts.conversions values ('Slack2', 'Slack', 2, 'Sent');
go
alter table alerts.status add SlackChannel varchar (32);
go
