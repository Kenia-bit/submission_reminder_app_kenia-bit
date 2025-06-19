INTRODUCTION

our app is called submission_reminder_app which helps to track which students haven't submitted their assignments yet.

1. HOW IT WORKS

This app checks a list of students and tells you which ones haven’t submitted a specific assignment.

By this application you're able to:
- Set up the app with your name.
- See students who haven't submitted.
- Change the assignment name and check again.

N.B: You'll need a computer with Linux or a terminal that supports shell scripts and basic knowledge of how to open and type in the terminal.

2. How TO SET UP

1. Open your terminal
2. Type this and press Enter
a. bash create_environment.sh or 
b. ./create_environment.sh

3. After running create_environment.sh you will see a text which says "Enter your name" then you can type any name that you want for example (Kenia) and then press enter
This will create a folder called submission_reminder_Kenia (with your name). and inside that folder, the app it's self will prepare everything it needs automatically.

4. After all you run this to start the app:
 ./submission_reminder_kenia/startup.sh and the app will check the current assignment and show you a list of students who have not submitted.

DIFFRENT ASSIGNMENT

5. Now to check for a different assignment, you run:

a. As we've seen above you either use bash copilot_shell_script.sh or ./copilot_shell_script.sh
b. And you’ll be asked to type the new assignment name for example (Git) and press enter. The app will then check who hasn’t submitted that assignment you prompted.

6. The App Folder contains
 When you set it up, the app creates:

a. A file that stores student submissions.

b. Files that help the app run.

c. A startup file you use to start the app.

CONCLUSION

You only need to run the setup once. After that, you can run the app anytime by using the startup.sh file.
And you can also change the assignment name as many times as you want using the copilot_shell_script.sh.
