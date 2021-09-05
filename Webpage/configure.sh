#!/bin/bash
filename=$PWD/configuration.js

while true; do
    read -p $'Would you like to configure the Smart Contract address? Y/N\n' yn
    case $yn in
        [Yy]* ) read -p $'Please enter your address: \n' address; sed -i '/contractAddress/d' $filename; echo "const contractAddress = \"$address\"" >> $filename; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yes or No.";;
    esac
done

while true; do
    read -p $'Would you like to configure the Ethereum address? Y/N\n' yn
    case $yn in
        [Yy]* ) read -p $'Please enter your address: \n' address; sed -i '/ethereumAddress/d' $filename; echo "const ethereumAddress = \"$address\"" >> $filename; break;;
        [Nn]* ) break;;
        * ) echo "Please answer Yes or No.";;
    esac
done

echo "Configuration has been successful. Those are your configured addresses:"
echo ""
cat $filename
echo "" 