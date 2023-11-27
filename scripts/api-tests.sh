# GET alertListChannels
curl https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlistchannels?code=h9Rqvtnv2g3Nq7Z_1ACpyBPpT4voSfYUQKBocupponx8AzFue0xOSA== -v

# GET alertLists
curl https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlists?code=C6ZiJGylW_wTYn4JU8nSu_LBG8G0sbCFSDCloIn7QTNKAzFuZrjW3w== -v

#
curl -X PUT https://dev-gh-action-demo-function-repysa6fou2tw.azurewebsites.net/api/alertlistchannels?code=cNmiwRmRpLcW3p1HwNkFUyONsDXPoGsu8kzgZJragd4GAzFu9kjF1Q== \
    -H 'Content-Type: application/json' \
    -d '[{"alertListId": "1", "alertListName": "Alert List 1","teamsChannelId": "100","teamsChannelName": "Teams Channel 100"},{"alertListId": "2", "alertListName": "Alert List 2","teamsChannelId": "200","teamsChannelName": "Teams Channel 200"},{"alertListId": "3", "alertListName": "Alert List 3","teamsChannelId": "300","teamsChannelName": "Teams Channel 300"},{"alertListId": "4", "alertListName": "Alert List 4","teamsChannelId": "400","teamsChannelName": "Teams Channel 400"}]'
