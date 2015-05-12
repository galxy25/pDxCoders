#pdxCoders
CS Capstone 2015
Team-D

Raven Allan  
Parker Berger  
Laura DeWitt  
Brandon Isom(Sponsor Point of Contact)  
Brady Sullivan  
Evan Schott(Sponsor Point of Contact)  
Joseph Stewart  
Levi Schoen(Team Lead)  

##Project 
eLearning Platform

Christof Teuscher teuscher@pdx.edu
Samuel Sennott sennott@pdx.edu
Holly Lawson hlawson@pdx.edu


##Tools we are using:

Github:

For software version control, and to encourage the use of communication around code changes and merges.

Pivotal Tracker:

For project management. Use to create, assign, and track progress of tasks for individual team members and the group as a whole.

Google Calender:

For setting up meetings and coordinating project deadlines and time lines.

SourceTree or Terminal:

SourceTree is a **free** SVC program that works with Git, SVN, Mercuial, and provides a graphical interface for managing code repositories. The alternative to such a program is using git via the command line.

Slack:

Can be found at pdxcoders.slack.com

Used for team communiques and communication between team members.
##Source Control Workflow

Branches:  

* master(production)  
* staging-beta(testing)  
* development(equal to staging-beta, not deployed)  
*		features/  
*		bugs/
*		chores/
*		hotfixes/  
*		releases/  

Pull from development(rebase okay)  
Create new branch, i.e.  
	features/really_cool_thing_pivotalNumber  
	bugs/save_the_day_pivotalNumber  

Make changes, then commit like so:  
[(Finishes|Fixes|Delivers) #TRACKER_STORY_ID] Brief Description  
			-Commit Message comments go here  
			-“...“  
			-“…"  
Create pull request in GitHub.  
Must be code reviewed with at least one other team member before merging.  
Merge your local branch with staging-beta, then merge staging-beta with  development.  
**All merges to master(production) will be done by the team lead.** 

