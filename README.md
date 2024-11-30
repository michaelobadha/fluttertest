# fluttertest
 laara grouptest
# Technical test
Integrate the endpoints below
The first endpoint returns an array of properties.
curl --location 'https://dev.api.laaragroup.com/search/stays/filtered' \
--header 'x-app-id: 3a2f3e5b-4a89-4fcb-a7e1-31421c7a6344'
Each property has an id which will be used in the endpoint below
curl --location 'https://dev.api.laaragroup.com/search/stays/PROPERTY_ID_HERE' \
--header 'x-app-id: 3a2f3e5b-4a89-4fcb-a7e1-31421c7a6344'
Expectations
Consume the results in a flutter application.
Application setup and architecture is important
Proper state management practice is important
Upload the apk/aab or ipa app to firebase app distribution
Deliverables
Firebase app distro link and
Link to repo
Bonus points if you also include CI/CD, Github actions(preferred) or fastlane (accepted)
