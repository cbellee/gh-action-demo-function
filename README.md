# GitHub action to deploy an azure function using identity federation

## Prerequisites

- GitHub account
- Azure subscription
- Azure PowerShell module

## Setup

1. create a new GitHub repository
2. clone this repo to your local machine
  ![clone repo](/images/clone-repo.png)
3. set the local repo's remote to the new GitHub repo
    - `git remote add origin <HTTPS or SSH path from previous step>`
4. push the repo to GitHub
5. - `git push -u origin main`
6. get GitHub repoID by running the query below using the GitHub graphql explorer at this url
    - `https://docs.github.com/en/graphql/overview/explorer`

    ```graphql
    query {
        repository (name: "gh-action-demo-function", owner: "<your GitHub owner/username>")  {
              databaseId
        }
    }
    ```

![github explorer](/images/github-explorer.png)

7. save the repoID for later use
8. create GitHub access token

    ![github access token](./images/gh-access-token.png)

    - go to your GitHub profile settings
    - select Developer settings
    - select Personal access tokens
    - select Generate new token
    - give the token a name
    - select 'All repositories' for the repo scope
    - select the following scopes
        - deployments:read/write
        - environments:read/write
        - metadata:read
        - secrets:read/write
        - variables:read/write
        - workflows:read/write

    ![github access token scopes](./images/gh-access-token-scopes.png)

9. run ./scripts/env_vars.ps1
  - `PS C:\> ./scripts/env_vars.ps1 -RepoId <GitHub RepoId> -Token <GitHib Access Token>`
10. run ./scripts/federated-identity.ps1 to create the identity federation
  - 