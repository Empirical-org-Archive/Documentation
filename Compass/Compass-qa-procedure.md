# Guide - QA Testing Compass

### Creating Accounts 
1) Create New Teacher Account 
2) Create New Student Account (from sign up). 
3) Connect Student account to teacher account via class-code. 
4) Create New Student Account (from teacher interface). 

### Assign Lessons
1) Teacher assigns new lessons to student. 
2) Student confirms that lesson is received. 
3) Teacher edits the details of the lesson. 
4) Student confirms that the details have been edited. 


### Old Teacher Account
1) Use a pre-created teacher account (Teacher account username: qa_test, password: qa_test). 
2) Teacher assigns a lesson to a student. Student completes lesson (see complete lessons, below). 
3) Student re-attempts an old lessons, with a score that pre-dates the unit test. 

#### Complete Lessons
1) Student completes an "Unassigned" sentence writing activity. System has access to a series of pre-created activities that have one word answers. On this test, run "Correct" answers. 
2) Student should receive a green score. Confirm that the cache breaks, and new score assigned. Confirm that the lesson moves from assigned lessons to completed lessons. 
3) Confirm on the teacher side that the scorebook updates with a green score. 
3) Student re-tries a lesson, this time getting each answer wrong, and receives a "0". Confirm that the score goes from green to red. 
5) Confirm on the teacher side the score goes from green to red. 