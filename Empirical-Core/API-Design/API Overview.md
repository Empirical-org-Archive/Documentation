# API Integration Notes 

### Activity
An Activity an object that contains the data for a session.

Is each practice question an activity?

Key Reference point - activities belong to sections, workbook, etc.

Name -

Description -

UID -

API is keyed off the UID.

ActivityClassification. Each type of tool. The API description of what that type is.

Topics - Each of the activities belong to a topic.

The Data field - a Hash in the database. The body and the instructions, both are YAML serialized. Pass a .JSON string with the data.

There are three end-points:

The GET - get the UID

Patch to the URL - you can update the record.

Create - Create a new record (not tested well).

It's agonistic about how it stores data - it doesn't require a particular set. It validates for blanks. The API error messages should be clear.

Inside the .JSON are three hashes: Meta - the status string. Errors hash Message String -

How well the string did. A way of tracking what happens.
The base name of the element is the thing you are looking for. Base Level Element called Activity, and the full JSON tree is within activity.

Profile
Activity Session
Authentication is disabled at this point.

### Activity Session

It tracks the user interaction on Quill Writer. There are certain events that need to happen. You can format the response back anyway you want, but I'd advocate for being as clear as possible. It's a free form field, so you can do whatever you want.

An activity has to be related to an assignment from a user. A user is going to pick a classroom activity. What is a classroom activity ID? An activity is going to have users An activity is going to have an activity session

A pairing ID field. A percentage field - how much is done. Time Spent - calculated by core. Time Completed -

Three key states When an activity session is created When an activity session is holding? Start - when an activity has started. Set the ping back to the system. Send data Send Finish - it will pull the finish state.

You're responsible for calculating the percentage. You can create a session from the API. It has the updates to tell it to end it.

The Activity Session ID - you want to handle it cleanly? You want to have the same object update. How do you be mindful that you keep it clean? Key against that ID consistently, get a new one for the new activity.

The User Data We've got to sanitize the data that comes out, i.e. IP

Caching is Great Pull the ID for the session, rather than having to pull it at every ping.

Creating a cookie for the info. An issue of hashes with. Grab the

Testing on staging Create activities on staging and use that to test.

SSL traffic on the API.
