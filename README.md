# mc-glacier-upload
Container to run glacier-cmd in a loop and upload files in mapped folder

## Usage
docker -v /local-dir-to-upload:/upload run metacloud/mc-glacier-upload

## Disclaimer
Although nothing has been modified with the glacier-cmd utility the scripting around it may eat your data or set fire to your home.

## Acknolwedgement
This container uses the glacier-cmd utility developed by Urban Škudnik.
https://github.com/uskudnik/amazon-glacier-cmd-interface
