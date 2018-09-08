# ts-api-gateway
API gateway to secure admin requests to create Gitea user account

The motivation behind this project is to supplement the Gitea git server's API with a secure way of creating user accounts and avoid storing the admin API key (required to create an account) in client apps.  The process of creating a Gitea user account:

1. Client app makes a post request to this API gateway containing the user's desired username and password.

2. API gateway server stores the admin token.  It constructs a post request to the Gitea API to create the user account.  This request contains the username and password previously obtained from the client app as well as the admin API token necessary to grant the privilege of attempting to create the account.

3. If the username is unique and the admin API key is verified, the account should be created.  The Gitea API sends a response to the API gateway indicating account creation success/fail.

4. The API gateway passes a response back to the client app to relay information from the Gitea API regarding account creation success/failure.

5. At this point, if the account creation is successful, the user should be able to log in with the previously created username and password.

*Note: It is the responsibility of the client app to create subsequent user-related requests directly to the Gitea API.  The API gateway is simply to facilitate initial account creation.
