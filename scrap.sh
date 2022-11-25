#!/bin/bash

jsonReceived=$(mktemp /tmp/etherscrap-received.XXXXXX.json)
jsonContracts=$(mktemp /tmp/etherscrap-contracts.XXXXXX.json)

[ $ETHERSCAN_API_KEY ] && api=\&apikey=$ETHERSCAN_API_KEY

curl https://api.etherscan.io/api?module=contract\&action=getsourcecode\&address=${1}${api} > "${jsonReceived}"

jq -r '.result[0].SourceCode' "${jsonReceived}" | sed 's/^{{/{/' | sed 's/^}}/}/' | jq -r '.sources' > "${jsonContracts}"

for file in $(jq -r 'keys[]' "${jsonContracts}"); do
  mkdir -p $(dirname $file)
  jq -r --arg file "$file" '.[$file].content' "${jsonContracts}" > $file
done

rm "${jsonReceived}" "${jsonContracts}"
