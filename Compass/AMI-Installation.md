# Guide - Using an Amazon Machine Image

*Introduction: Amazon will create a virtual private server for you loaded with the latest environment and code. You can hack on this code without installing the code locally.*

**Note: Each repo has its own AMI key. Here are the latest keys:**
- Stories With Friends: ami-e494678c



1. Go to http://aws.amazon.com/console/


2. Click “Sign in to the AWS Console”

![0](https://s3.amazonaws.com/Empirical-Documentation/AMI-Install/image00.png)

3. Click “EC2 – Virtual Servers in the Cloud”

![1](https://s3.amazonaws.com/Empirical-Documentation/AMI-Install/image01.png)

4. Make sure that you’re in the “US East (N. Virginia)” region in the top-right dropdown:
Click “AMIs” under “Images” on the left panel.

![2](https://s3.amazonaws.com/Empirical-Documentation/AMI-Install/image14.png)

5. Change “Owned by Me” to “Public Images” in the filters:

![3](https://s3.amazonaws.com/Empirical-Documentation/AMI-Install/image17.png)

6. Search for the Stories With Friends AMI ID (ami-e494678c, press enter to search):

Click “Launch” in the top-left:

You can select a larger instance if you prefer, but a free-tier eligible micro-instance will pack enough punch to run this project.  Click “Next:  Configure Instance Details” in the bottom-right:

Click “Next:  Configure Instance Details” at the lower-right
All the default setting should work for you – just launch 1 instance, you don’t want to launch as a Spot Instance or EBS Optimized or with CloudWatch monitoring (in order to remain free-tier eligible).  Once you’ve reviewed this screen, click “Next:  Add Storage”

You can increase volume size if you want from default – free tier should give you up to 30GB without charging, although if you spin up/shut down instances without shutting down EBS volumes you might wind up going over that quota, so we might want to look at all that before you try using more space (it would be a good exercise for you to increase the disk space on an existing instance down the line anyways)

Click “Next: Tag Instance” and add any tags you might want to use to describe the instance (solely relevant to personal organization – I personally rarely/never tag my instances, because even at work I never ran enough for it to get confusing)

Click “Next: Configure Security Group” – this is essentially your firewall for the machine.

You will definitely want to open a port for HTTP - click “Add Rule” and select “HTTP,” which should result in a TCP:80 rule being generated for “Anywhere”

Click “Review and Launch” in the lower-right of the screen.  Double-check that everything looks as expected, and make sure you see “Free Tier Eligible” under the “AMI Details” pane

Click “Launch” in the lower right
You’ll need to generate a new key pair for this in order to SSH to your instance, so select “Create a new keypair” from the dropdown that says “Choose an existing keypair”

Create a name for the keypair (another arbitrary/up-to-you value, keeping in mind that you’ll use this file every time you connect to the instance and do not want to lose it as you’ll be unable to connect to your instance out-of-the-box without it, although there are means by which you can circumvent this to some degree while losing everything in ephemeral storage by creating an image of the box and spinning it up with a fresh keypair).  Download the keypair, and click “Launch Instance” 
Click “Launch Instance” and then scroll down to the lower right and click “View Instances”

Your instance will start off with a “Status Checks” status of “Initializing – once this is “2/2 checks passed” you’ll be able to ssh to it using the Public DNS listed in the instance details pane at the bottom of the screen, and view the project running from a web browser by pasting the “Public DNS” into the address bar





Your username will be “ec2-user,” so your SSH connection string would look something like:

ssh –i /Users/Eric/Desktop/Excelsior.pem ec2-user@ec2-54-85-103-179.compute-1.amazonaws.com

(-i is the option flag to use a private key file instead of a password to connect, followed by the path to your .pem, although you’ll likely want to move that somewhere like ~/.ssh/ or ~/Documents/keys/ or something)
