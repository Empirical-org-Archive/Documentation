---
layout: post
title:  "Provisioning a Cofactor team"
date:   2014-06-04 10:39:56
categories: post
---
  

*Overview: Cofactor bundles together a number of services. To set up a Cofactor team, you'll need to set up each of these services. This document outlines how to set up each of these services.*
  
  
*Go to [Cofactor on GitHub](https://github.com/empirical-org/cofactor) to install Cofactor.*
  
  
 
## 1. Google Groups Setup
Create a new google group for each forum. 
  
To grab the embed code, go to manage > information > general information, and copy and paste this line:
https://groups.google.com/forum/embed/?place=forum/compass-questions

---

## 2. Gitter Chat Setup
Log into Gitter, and create a new room. Copy and paste the url.  

---
  
##3. Calendar Setup
Go to teamup.com and register a new team. From the settings panel you copy and paste the "modifier" tab. This enables people to modify the calendar without giving admin access. 
 
*Additional Settings:*
- Disable the "control panel". Add a description to the side menu. 
Specify the names of the various calendars, for example: "Pair Programming" and "Weekly Meeting Times".
- Under the identity tab, change the title of your team to "Click on the calendar to indicate a meeting time." Also, click "Customize", and then uncheck the logo box. This will ensure that the TeamUp logo does not display.
- Add the text to the control panel text box:
> Each team meets once per week through Google Hangouts to share its progress and successes. Use this calendar to set weekly meeting times and collaborative development sessions. Click on the calendar to set time in which you are available to meet. The team lead will send out a group meeting announcement.

---  

##4. Google Drive Settings
To embed Google Drive within an iframe, you grab the Folder Url. 

Folder URL:
https://drive.google.com/#folder0B1iqp0kGPjWsNDg5NWFlZjEtN2IwZC00NmZiLWE3MjktYTE2ZjZjNTZiMDY2

List view:
https://drive.google.com/embeddedfolderview?id=FOLDER-ID#list

---  

##5. Set up GitHub Issues
Huboard relies upon GitHub Issues. 

To get HuBoard to work properly, you'll need to set up the following labels within GitHub issues. 
For the status of the task:
- 0 - Backlog 
- 1- Ready
- 2 - Working
- 3 - Testing
- 4 - Done

For the type of issue:
- Bug
- Code
- Design
- Idea

---  

##6. Install Huboard
Huboard is open source software. You cannot natively embed Huboard within an iframe because it blocks the iframe. Quinn has created a fork of Huboard that disables the iframe block. Install Huboard on a free Heroku server and then embed the page. 

---  

##7. Install Contentify
Contentify provides a text editor for markdown files. Contentify if a new application, and it can be difficult to install. Forthcoming documentation should help. You can install Contentify on Heroku, and then enable Firebase to support collaborative editing. 


---

**Granting Permissions**

To edit Contentify, all writers must have write access to the repo. To enables contributors to use Contentify, while restricting write access to the main repo, create a seperate repo called "Documentation". Create a new team in GitHub called "Documentation Access". Invite all team members to the Documentation Access team. Give that team write access to the Documentation repo. Every contributor can now edit the markdown files, and all of your contentify files will live in the Documnetation folder. 

--- 

**Viewing Documentation**

At the moment, we are direct linking to the content via the link:
    http://empirical-contentify.herokuapp.com/#/learn-more/Compass/Installation.md
    http://empirical-contentify.herokuapp.com/#/learn-more/(folder)/(filename.md)
Embed this link within the iframe, and you will be able to see the documentation on the left hand side. In the future, we will set up a static site generator, such as Jekyll, and render the documentation via the site generator.    

--- 

**Why use Contentify instead of having people just edit markdown files in GitHub?**

1. **No iframe.** GitHub explicitly prohibits an iframe, so we can't embed the "edit" function as a service within Cofactor.
2. **Collaborative Writing.** Contentify supports multiple people editing a document at once. This is nice as a team can be working through a problem, and the team can all take notes on a shared app.
