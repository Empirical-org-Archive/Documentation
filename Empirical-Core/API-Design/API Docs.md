# API Docs

## High level overview

Empirical Core is our LMS for assigning activities and viewing results. The Empirical Core database contains a link to every single activity. For example, we currently feature 150 activities, and Empirical Core stores the name of each activity, a description of the activity, and a link to that activity. The application, Quill Grammar, contains all of the data about the lesson (the prompts, the practice questions, etc.)


- Lesson data is stored in Empirical Core and is parsed by Quill. 
- quill queries api through that data
- lesson passes id used to look up that information


## Setup Oauth

Currently, you must work with a Quill admin to create your oauth account. Send
your application info to hello@quill.org and you will receive a consumer token
and secret. You can also use the
[Empirical Core-Module-Environment](http://github.com/empirical-org/Empirical-Core-Module-Environment)
to setup your own Empirical Core and develop your application against that. This
guide will assume that you are using this approach.

## Setup Empirical Core

(use docker)

## Configure your application

__Sign in as an admin:__

 * Browse to http://localdocker:3000/session/new
 * email: admin@quill.org, password: admin

__Setup Oauth app:__

This creates your application as an Empirical Core oauth consumer. You will need to implement an oauth client within your application. 

 * Browse to http://localdocker:3000/oauth/applications/new
 * Enter a name for your app. Can be anything. 
 * Enter a redirect url. Most likely will be on localhost or localdocker,
   depending on your setup.

__Setup Empirical Core app:__

This sets up your apps' parameters in Empirical Core. You will need a `module_url` and a `form_url` (documented below):

 * Browse to http://localdocker:3000/cms/activity_classifications/new
 * Enter a name for your app. This is for convenience only, can be anything.
 * Enter a key. Must be unique. We're going to use "example" for this tutorial.
 * Enter your app's `form_url` and `module_url`. For Example, you could enter:

   ~~~
   form_url:   http://localhost:3000/form
   module_url: http://localhost:3000/module
   ~~~

   The guide will assume that you used these settings.

## Creating an activity

 * Browse to http://localdocker:3000/cms/activity_classifications/
 * Click on the "Activities" link next to your app name.
 * Click on "Add a new activity"
 * You should now be on a page with a url similar to 
   http://localdocker:3000/cms/activity_type/example/activities/new
 * Fill in the Empirical Core properties and hit "next".
 * From this page, you can begin to test your `form_url`.

## Setting up `form_url`


-------------------------------
The walkthrough ends here. The rest of this document is unorganized notes. 

-------------------------------

Empirical Core relies on two pages within your app

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

Authorization for a resource is based on the access token and the user it is
associated with.

## Activity specification

An activity requires to endpoints to function, `module_url` and `form_url`.
These urls are loaded to display and update an activity.

For example, if your `module_url` is `http://app.example.com/module` then
Empirical Core would load a url similar to this:

~~~
http://app.example.com/module?uid=asdf1234&sid=5678aoeu
~~~




Requirements of an activity app:

Has a URL for a form (To create and edit activities) and a URL to load an
activity. Urls can be specified in config.

App must auth using Empirical Core's oauth. 

When a student loads an activity, the apps module URL loaded with to params:

Session id
Activity id

App will then use the access token to retrieve the two id's. The app can then
store whatever state information it needs in the session, but it * must * keep
the status set to an appropriate value. The session state data will allow the
app to load a partially completed activity. The app must set the status to
"finished", otherwise Empirical Core will always provide the same session id for a
given activity and user to allow the user to complete the (presumably)
unfinished activity.  Once the activity is finished and the score has been
saved to Empirical Core, the app should use the Empirical Core library to signal the parent
frame to redirect to the results page:

(Js example goes here)

Again, the app should set the session to "finished" before calling this JavaScript. 

Activity Management

Empirical Core will load the form URL to allow editing of values specific to the
activity. Empirical Core has standard values (name, description, status) that are
edited on Empirical Core, and loads the apps form URL in an iframe to modify the
activity's vendor-specific values. The app will receive a save signal from the
parent frame which should cause the app to submit the values to the API using
the provided activity id:

(Example event receiver goes here)

The app will then send a save success signal which will cause the parent frame
to redirect.


