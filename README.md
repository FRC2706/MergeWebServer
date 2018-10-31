# THIS PROJECT HAS BEEN DEPRECATED
It is being replaced with mergserv. It has not been maintained in over a year, and contains known security vulnerabilities. Please, **DO NOT USE THIS PROGRAM**. Thanks.


# Merge Web Server
MergeWebServer is a web server written in Rails, intended for syncing data with scouting apps, such as [MCMergeManager](https://github.com/FRC2706/MCMergeManager). It allows clients to upload and download the scouting data they have recorded, and provides functionality to sync with [The Blue Alliance](https://www.thebluealliance.com/) so you don't have to.
### Syncing with Blue Alliance
To sync with Blue Alliance, simply execute `echo 'SyncWithBlueAllianceJob.new.perform("your_team_number")' | spring rails console`. If that doesn't work, try `echo 
'SyncWithBlueAllianceJob.new.perform' | bundle exec rails console`. Obviously replace `your_team_number` with your team number, e.g. `.perform("2706")`
