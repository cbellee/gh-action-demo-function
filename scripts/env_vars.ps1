# get repoID using GH graphql explorer
# https://docs.github.com/en/graphql/overview/explorer
#
# query {
#    repository (name: "gh-action-demo-function", owner: "cbellee")  {
#          databaseId
#    }
#  }

$repoId='712657468'
$environments = Get-Content ./env_vars.json | ConvertFrom-Json

# get TOKEN from .env file
Get-Content ../.env | ForEach-Object {
    $name, $value = $_.split('=')
    "$name : $value"
    Set-Content env:$name $value
}

# create GH environment vars from JSON file
foreach ($e in $environments) {
    foreach ($variable in $e.variables) {
        $envName = $e.environment
        $varName = $variable.name
        $varValue = $variable.value

        $body = @{'name'="$varName"; 'value'="$varValue"} | ConvertTo-Json

        Invoke-WebRequest -Uri https://api.github.com/repositories/$repoId/environments/$envName/variables `
        -Method Post `
        -Headers @{"Accept"="application/vnd.github+json";"Authorization"="Bearer $($env:token)";"X-GitHub-Api-Version"="2022-11-28"} `
        -Body $body
    }
}

# read GH environment vars
foreach ($e in $environments) {
    Invoke-WebRequest `
    -Uri https://api.github.com/repositories/$repoId/environments/$($e.environment)/variables `
    -Headers @{"Accept"="application/vnd.github+json";"Authorization"="Bearer $($env:token)";"X-GitHub-Api-Version"="2022-11-28"}
}
