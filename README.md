# submission_reminder_app_julesineza

This project contains two main shell scripts that help manage student assignment submissions.

The first script is called  create_environment.sh.
-------------------------------------------------- 

When you run it, it asks you to enter your name. 
Then it creates a new folder with your name in it, and inside that folder it creates several files and subfolders. 
These files include a script to send reminders, a functions file, a list of students and their submission statuses, a configuration file with the assignment name and days left, and a startup script to run everything.
This script sets up everything you need to start using the submission reminder system.

The second script is called copilot_shell_script.sh.
----------------------------------------------------

This script asks you to enter a new assignment name. 
It then finds the configuration file inside the folder created by the first script and updates the assignment name there. 
After that, it runs the reminder program using the updated assignment. 
This lets you change the assignment easily without manually editing files.

When running these scripts, sometimes you may see a “permission denied” error. This means the scripts or startup files are not set as executable. You can fix this by using the command chmod +x on the files or folders in question. Usually, the setup script tries to make everything executable, but sometimes you may need to do it yourself.

To use the project, first run create_environment.sh and enter your name to set up the environment. Then run copilot_shell_script.sh and enter the new assignment name to update the system and see which students have not submitted their work.

This project is useful for beginners to learn how to use shell scripting for file management, editing files, and running small programs from the command line. It shows how scripts can interact by creating folders, writing files, updating text inside files, and running other scripts automatically.

If you follow the instructions step by step, you should be able to create the environment and run the submission reminders successfully.