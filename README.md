It's dangerous to go alone. Here, take [this Wiki](https://github.com/FRC2706/MergeWebServer/wiki)!
# Merge Web Server
MergeWebServer is a web server written in Rails, intended for syncing data with scouting apps, such as [MCMergeManager](https://github.com/FRC2706/MCMergeManager). It allows clients to upload and download the scouting data they have recorded, and provides functionality to sync with [The Blue Alliance](https://www.thebluealliance.com/) so you don't have to.
### Automagic Installation (Debian-based Linux only)
To install the server on Ubuntu, simple run the `install.sh` script with `sudo ./install.sh`. To start the server, execute `./start.sh`. For instructions on installing on Mac, read 
`install.sh`, and may the programming gods have mercy on you if you decide to install it on Windows. I have it working with Arch, but trust me you don't want to get into that either.
### Syncing with Blue Alliance
To sync with Blue Alliance, simply execute `echo 'SyncWithBlueAllianceJob.new.perform' | spring rails console`. If that doesn't work, try `echo 'SyncWithBlueAllianceJob.new.perform' | bundle exec rails console`
