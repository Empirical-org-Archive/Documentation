# API Docs Questions

### Are there ids as well in the /activities JSON responses?

Yes, there is the ID in the JSON. The UID is the activity ID. 


### Will Stories With Friends be handed an activity id via iFrame?

Yes, via the UID. 


### For PUT calls, can it be one or more keys, or must it be the entire JSON object.

No, you can choose to only include the properties you want to update.

### In an Activity_Session, what is the “data” field?

Data is a json object.

### For the access token mentioned throughout the docs. Does each student get a different access token?

The access token is through the OAuth, and that is unique to each user. These OAuth tokens expire. 


### Related, where do the uid and sid query string parameters play in?

UID is activity id. When a user enters an application, an activity session has already been created. An activity session is created when the activity is assigned to the student. 

?anonymous=true means that a user can go through without an activity session. If your application requires a session to run properly, you can create a temporary session using the API.

Data from the activity that is going to be saved (e.g. a story the students produce) will be saved back to the activity session. 

### In Stories with Friends, how do you identify a user?

SID is shared, and the UID is the identification number. 

Two students will have their own activity session (UID). 

### How to get the words list for the Activity?

The activity_session does not contain any data about the activity. Instead it produces the results. 

### What is an Activity?
If there were five sets of words, each set of words would have its own activity. 

Applications provide a form url to create activities for that particular application. 

An application creator could set it up to accept any form of data. 

### How do you integrate an app?

You need to create a javascript event when an event is created, and an activity when the form is filled. 

### Resizing the window? 

It should do so automatically. 

### How does the application send data back to Empirical Core for creating an Activity?

Take data and move into the json object, and then post data using API.
