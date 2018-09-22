#!bin/bash/

# start express gateway server before running this script:
# run from home directory of express gateway:
#   npm start

# credentials.txt should contain keyId on first line and keySecret on second line
credentials=()
for line in `cat credentials.txt`;do
	credentials+=($line)
done;

eg users create -p 'username=tsdesktop' -p 'firstname=ts' -p 'lastname=desktop'

# create credentials for user tsdesktop to authenticate with the gateway
keyID=${credentials[0]}
keySecret=${credentials[1]}
eg credentials create -t key-auth -c tsdesktop -p "keyId=$keyID" -p "keySecret=$keySecret"


