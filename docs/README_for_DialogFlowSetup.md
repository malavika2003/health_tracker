# To configure the DialogFlow:
## To generate `dialog_auth_flow.json` from Google Cloud Platform (GCP), you can follow these steps:

1. First, create a service account key by following the instructions provided in [here](https://help.mypurecloud.com/articles/configure-the-google-cloud-dialogflow-platform-service-account-credential/).
2. Save the downloaded JSON key securely.
3. Next, create a request body for the Dialogflow API by following the instructions provided in [here](https://cloud.google.com/dialogflow/cx/docs/quick/api).
4. Save the request body in a file named `dialog_auth_flow.json`.
5. Replace the file in the assets folder of the project.

Additional References[^1].
[^1]: [How to create a chatbot using Dialogflow Enterprise Edition and ...](https://medium.com/google-cloud/how-to-create-a-chatbot-using-dialogflow-enterprise-edition-and-dialogflow-api-v2-923f4a965176) .
[^2]: [Configure the Google Cloud Dialogflow ES Platform service account ....](https://help.mypurecloud.com/articles/configure-the-google-cloud-dialogflow-platform-service-account-credential/).
[^3]: [Quickstart: Interactions with the API | Dialogflow CX - Google Cloud.](https://cloud.google.com/dialogflow/cx/docs/quick/api)
[^4]: [Setting Up Authorization for HTTP Cloud Functions in GCP.] (https://dev.to/jakewitcher/setting-up-authorization-for-http-cloud-functions-in-gcp-45bc)
[^5]: [Dialogflow API | Dialogflow CX | Google Cloud.](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3-overview)