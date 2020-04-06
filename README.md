## 3Scale with Moesif API Logging Example

Example Docker application using [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif) to log API calls to [Moesif API analytics](https://www.moesif.com)

To learn more about configuration options, please refer to [Moesif OpenResty plugin](https://github.com/Moesif/lua-resty-moesif).

## How to run this example

1. Clone this repo and edit the `init.conf` file to set your actual Moesif Application Id.

Your Moesif Application Id can be found in the [_Moesif Portal_](https://www.moesif.com/).
After signing up for a Moesif account, your Moesif Application Id will be displayed during the onboarding steps. 

You can always find your Moesif Application Id at any time by logging 
into the [_Moesif Portal_](https://www.moesif.com/), click on the top right menu,
and then clicking _API Keys_.

2. Edit the Dockerfile to set the following details:

- Provide the 3Scle ACCESS_TOKEN and ADMIN_PORTAL_DOMAIN detail to the `THREESCALE_PORTAL_ENDPOINT` env variable.
You would find the ACCESS_TOKEN and ADMIN_PORTAL_DOMAIN by configuring [3Scale](https://www.3scale.net/).

- Provide the RedHat credentials (UserName/Password) for registering subscription-manager at [RedHat](https://www.redhat.com/en)

3. Build the docker image
```bash
docker build . --tag apicast:latest
```

4. Start the docker container:
```bash
docker run -p 8080:8080 -d apicast:latest
```

By default, The container is listening on port 8080. You should now be able to make a request: 

```bash
curl -X POST -H "Content-Type: application/json" -d '{"name":"moesif"}' "http://localhost:8080/api/user" -H 'User-Id:my_user_id' -H "Company-Id:my_company_id"
```

5. The data should be captured in the corresponding Moesif account.

Congratulations! If everything was done correctly, Moesif should now be tracking all network requests that match the route you specified earlier. If you have any issues with set up, please reach out to support@moesif.com.