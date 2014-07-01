# API Docs

The quill API uses oauth for auth. 

## API Endpoints

The API is organized into endpoints that follow a standard format. For example:

Plural works like this:
Sessions
Activities

POST /types
Creates

PUT /types/id
Updates

GET /types/id
Gets single item

Singular:
Me
Ping

Works like:

GET / POST / PUT /type

Creates, updates, displays the resource.

Authorization for a resource is based on the access token and the user it is associated with.

## Activity specification

An activity requires to endpoints to function, `module_url` and `form_url`. These urls are loaded to display and update an activity. 


Requirements of an activity app:

Has a URL for a form (To create and edit activities) and a URL to load an activity. Urls can be specified in config.

App must auth using compass's oauth. 

When a student loads an activity, the apps module URL loaded with to params:

Session id
Activity id

App will then use the access token to retrieve the two id's. The app can then store whatever state information it needs in the session, but it * must * keep the status set to an appropriate value. The session state data will allow the app to load a partially completed activity. The app must set the status to "finished", otherwise compass will always provide the same session id for a given activity and user to allow the user to complete the (presumably) unfinished activity.  Once the activity is finished and the score has been saved to compass, the app should use the compass library to signal the parent frame to redirect to the results page:

(Js example goes here)

Again, the app should set the session to "finished" before calling this JavaScript. 

Activity Management

Compass will load the form URL to allow editing of values specific to the activity. Compass has standard values (name, description, status) that are edited on compass, and loads the apps form URL in an iframe to modify the activity's vendor-specific values. The app will receive a save signal from the parent frame which should cause the app to submit the values to the API using the provided activity id:

(Example event receiver goes here)

The app will then send a save success signal which will cause the parent frame to redirect. 
