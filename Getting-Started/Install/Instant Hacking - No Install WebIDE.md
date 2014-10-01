# Instant Code Development with Codio

*Installing Rails and Postgres can result in troubleshooting issues. Codio.com provides a cloud based enviornment. Empirical Core is pre-installed on the Codio machine with Rails and Postgres.*

### 1. Log into Codio.com

### 2. Go to the Empirical box

In a new tab, go to this address to fork the project: https://codio.com/empirical-org/Empirical-Core-Sandbox

### 3. Fork the project

 Click on the project, then fork. You can keep the name. 

**Important! Make sure to select the third option "Clone both the project and its box."**

![screen shot 2014-09-04 at 8 36 43 pm](https://cloud.githubusercontent.com/assets/3667179/4159841/33ee7d22-34ab-11e4-94dd-964238810ba0.png)

![screen shot 2014-09-04 at 8 46 41 pm](https://cloud.githubusercontent.com/assets/3667179/4159868/e49285ce-34ab-11e4-8886-e1388ec2f524.png)

### 4. Open the Server Terminal

Click on the "Rails S" button. Wait till it says "Listening on tcp…"

![screen shot 2014-09-04 at 8 48 55 pm](https://cloud.githubusercontent.com/assets/3667179/4159873/f24dee10-34ab-11e4-8da1-b78423ef54c6.png)

### 5. Launch the local server.

Click project index button, and then select from the drop down "Box URL"

![screen shot 2014-09-04 at 8 55 16 pm](https://cloud.githubusercontent.com/assets/3667179/4159886/2e34aea0-34ac-11e4-8c27-8cf529ca833a.png)

### 6. Share your code!

The generated url can be shared with anyone online. Make changes to the code and then share your changes with others. For example share the url: http://mango-dance.codio.io:3000/

# Part 2. Creating a Pull Request with Codio

### 1. Fork the Project

In a new tab, fork the project from here: https://github.com/empirical-org/Empirical-Core/

![screen shot 2014-09-04 at 9 05 01 pm](https://cloud.githubusercontent.com/assets/3667179/4159941/9b10046a-34ad-11e4-9027-98e6e63ed163.png)

### 2. Copy the Git URL

![screen shot 2014-09-04 at 9 05 41 pm](https://cloud.githubusercontent.com/assets/3667179/4159965/e21864d8-34ad-11e4-826d-a3004a1e59c0.png)

### 3. Open the Terminal

Go back to your codio tab, and press tools > terminal.

![screen shot 2014-09-04 at 9 06 22 pm](https://cloud.githubusercontent.com/assets/3667179/4159974/1707a2b2-34ae-11e4-8b1b-c80e0debc366.png)

### 4. Add the Project

From the terminal line, input the following line you've copied and pasted. 
```
git remote add emp-sandbox https://github.com/[YOUR GIT USERNAME]/empirical-core.git   
```
Your project is now called emp-sandbox. 

### 5. Check out the Branch

You are now going to create your own branch of the code. 
```
git checkout -b [YOUR NAME]
```
Your Name is going to be the name for the branch, e.g. Peter-Gault. 

### 6. Hack and Push

Now that you’re in your branch, you can make your changes and do your usual git add and git commit commands below. When you’re satisfied, you can now push to your repo.
```
git add -A
git commit -m “your commit message”
git push emp-sandbox [your branch name]
```

### 7. Submit your Pull Request at Github

Go to your Github Empirical-Core repo and make your pull request to us by clicking the button “Compare and pull request."

![7187984_228105207_14899283](https://cloud.githubusercontent.com/assets/3667179/4160019/5b7defe0-34af-11e4-83d7-938e21f81de5.png)

### 8. Change the Branch you are Submitting to. 

Your are going to merge your branch with the "emp-sandbox" branch. Click on Edit at the top right to change the Base you are making your pull request to from the “develop” branch to the “emp-sandbox” branch. 

![7187984_228105481_14899311](https://cloud.githubusercontent.com/assets/3667179/4160038/0eae3cf0-34b0-11e4-8a57-35d8c41353c9.png)

### 9. Write a Commit Message

Write your commit message specifying the changes you made. 

[Here is a great guide for writing proper commit messages.](http://ablogaboutcode.com/2011/03/23/proper-git-commit-messages-and-an-elegant-git-history/)

### 10. Thanks! We'll review your Pull Request

We'll contact you with you questions. Feel free to reach us on Gitter or our mailing list. 
