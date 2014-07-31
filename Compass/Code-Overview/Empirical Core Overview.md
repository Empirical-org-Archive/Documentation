
# Empirical Core Code Overview

** *Here is a complete overview of Empirical Core through a question and answer format.* **


# Introduction 
### What do I do if I have a question that is not answered here?
Please add your questions to the bottom of this markdown document via our GitHub page.


### What is Empirical Core?
Empirical Core is a platform for educational games and activities. We integrate all of our activities into the Empirical Core Platform via the Empirical Core API. 

### What is the difference between Quill and Empirical Core?
Quill is a brand focused on providing writing activities for K12 English teachers. All of our educational activities are integrated into Empirical Core, and Quill provides a curated list of activities from Empirical Core for English teachers. Quill exists as a brand and content library, while Empirical Core is the core technical product. 

### What is the basic User Experience? 
Admins integrate applications into the Empirical Core backend. Educators create activities for those applications and store them within Empirical Core. Teaches browse through our activities and assign activities to individual students. Students log in through their student portal, where they see every single activity that has been assigned to them.  The student then selects an activity and clicks on it. The application creates an ActivitySession, and the activity is loaded within an iframe. A student completes the activity, and when the student hits an endpoint, the student sees her results and is returned to the student portal. Students and teachers see data on their progress. 

*See the complete user experience via our integration testing document*

Demo the student and teacher experiences with our sample log ins:
>Teacher Portal - Username: Teacher, Password: Demo
>Student Account - Username: Student, Password: Student


# Activity Implementation
### What is an application?
An application is a program that provides a type of learning experience. For example, in the Passage Proofreading app students are given a special type of activity in which they 

### What is an activity? 
An activity is a single, fixed length learning experience for a student. For example, many of our activities are ten minute experiences. In each activity there is a goal, and when that goal is competed, the user hits an end point where that activity is completed. Students see their results, and they are given a link back to their student portal. From the student portal students then select additional activities.

### What is an ActivitySession?
When an activity is launched, (Empirical Core?) creates an ActivitySession. The Activity Session stores the user's progress. If a user quits out, the user can restart the activity via the ActivitySession.

### Why are activities presented through an iFrame?
We present our activities through an iFrame to provide a single branded experience for our students and teachers. Our users only need to go to Quill.org, and they can then seamlessly access all of our activities. 

### Can an activity be connected to Empirical Core without being within an iframe?
Yes. Our activities are presented within an iFrame for the ease of use our K12 students. However, users can also  go to your domain, and log in using their Empirical Core id. We support log ins via OAuth. 


# API Design

### Where is the documentation for the API? 
The documentation for the API is stored within a YAML file. Included in the YAML file are comments that describe each call. We use a script to extract that information and present it as a webpage here.


### What data fields do you employ?
[Please see this document for a complete overview of the data structure of our API and Empirical Core.](https://github.com/empirical-org/Documentation/blob/master/Compass/API-Design/API%20Docs.md)

### Universal Fields for all Activities

*These fields apply to all activities.*

**Activity Name:**The activity name provides not only a title to the activity, but also an identifier of the topic at hand. For example, the title "3.2.4 Capitalizing Letters in Titles" not only names the activity, but also describes the concept. 

**Description:** The description for an activity details the goal of the activity. For example, write ten sentences using common, proper, and possessive nouns. 

**Instructions:** The instructions describe what the student must do to complete the activity.

**Status:** When a student begins an activity it is given a status. **This needs more info. How does this work?**

**Concept Tag:** As a future feature, we will tag individual events within an activity. These events will provide a level of insight into how the student is performing.


### Activity Specific Variables

*These fields are specific to a particular activity.*

**Body (Proofreading Passages):** The body field contains the text of a particular passage. This body text contains all of the errors, seeded with our particular syntax. 

**Rule Question Order (Sentence Writing):**


### How do you handle data that is not employed within pre-defined fields?

We handle data blobs through ______________.  Over time, we will build defined fields for particular data sets as needed. 


# User Experience - Student and Teacher Portals. 

### What is the user experience?

To get an understanding of the user experience, we highly recommend that you walk through the entire user experience. One can walk through every step in our UX in under fifteen minutes, and this will give you a complete sense of our product. 


### Why does a classroom have an assigned activity?

An activity can either be in the state of assigned or unassigned. When an activity is assigned, it moves from an assigned to an unassigned state. 


**This is a bad feature. The problem is that once a teacher assigns a lesson to a group of students, the teacher cannot assign the lesson to another group of students. In the future, we should set up our system so that a copy of the activity is assigned to a group of students. This means that the activity can be assigned again to another group.**


### Where is a student assigned activity? 


### What is the many to many table between unit and classroom?
[Missing]. 

### Why do student only belong to one classroom?
At the moment we only have individual teachers using our platform. We will look at this feature later.




# Activity Organization - Content Hierachy

### How are activities arranged within Empirical Core?
Activities are arranged into topics, and topics are arranged into sections. At the moment there is one section for each grade level (grade one, grade two, etc.). Each section has a number of topics. For example, the grade one section has the topic: 1.1c. Use Singular and Plural Nouns with Matching Verbs. This topic has  a number of activities, such as "Sentence Writing: Singular Nouns" and "Sentence Writing: Plural Nouns". 

### How does one assign a topic and section to an activity?
At the moment the topics and sections are assigned through a CMS restricted to admins. App developers will have their activities filed into Empirical Core via an admin.

### How does a developer implement an edit to an activity?
There are two models for how content can be stored within a database. Under the independent database model an application controls its own database and implements its own edits. Under the Empirical Core database model activities are stored within Empirical Core and edited through our CMS.

### Independent Database Model
Under this model, each application has its own database. Certain admins are given permission to edit the database through a GUI.  

### Empirical Core Database Model: Under this model (not yet implemented), each activity is stored within a central Empirical Core database. When a student initiates an application's activity, Empirical Core pass over the activity's content to load within the application. In this model, an activity is implemented and 

### Lesson Editor
As a note, in the future we will expose this interface so that anyone may edit a lesson. We will likely adopt a pull request model, where users can suggest edits, and approved edits are added to the database. This interface will be a separate interface, built on topp of our databases, and will pass data to the database via the Empirical Core API. 
 

# Glossary

### Empirical Core
Our platform for interactive activities. With Empirical Core teachers can seamlessly assign activities to students and view results. 

### Quill 
A marketing brand of English Language Arts activities focused on the K12 market. Quill utilizes a curated list of Empirical Core applications and activities. 

### Application 
An application is an independent program, with its own code base and learning experience. Applications are integrated into Empirical Core and also exist independently of Empirical Core.

### Activity
An activity is a fixed length length learning experience. For example, each proofreading activity is a single passage that takes approximately 10 minutes to proofread. 

### Empirical Core Database Model
The Empirical Core database model means that the content of the activities are stored on the Empirical Core database, and they are loaded into the application when the user starts the application. This model is popular when a lesson has a pre-defined, fixed set of content. For example, if an activity has only ten words a prompt, all of that data can be pulled from the Empirical Core database.

### Independent Database Model
The independent database model means that the content of the activities are stored in the application's own database. This model is popular when the activity provides randomized content. For example, if an activity provides a randomized question from a question bank, the data should be stored on its own application. 








