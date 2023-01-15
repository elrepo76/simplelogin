simplelogin
===========

A simple program written in .NET 6 and ReactJS.
Because of React, you will need Node.js installed.
It is for demo purposes.
simplelogin includes 2 solutions:

Login-backend in .NET 6.
login-frontend in ReactJS.

To run the application:

1. Open a powershell terminal and cd to folder database\ ; run "build_db_container.ps1".

2. In Visual Studio 2022 open Login-backend\Login-backend.sln

3. Build and run Login-backend.sln using IIS Express.
   Opens a browser with the website pointing to swagger website. Close it.
   swagger was included in the orginal .NET 6 project, but it is not used
   for this simplelogin. Very useful to test the db connections!   

4. In Visual Studio open a Developer Powershell terminal. 
   cd to folder ..\login-frontend\.
   Type: npm install react-scripts
   this command creates the npm_modules folder needed for this project
   
   Type:  npm start
   This is the Login form for simplelogin.
   
   NOTE: I am running Node.js v19.4.0
   Because of that I had to edit package.json lines 16, 17.
   If 'npm start' runs with issues revert these changes to:
   
   "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
		
5. Test with valid users:
Username: rocio   Password: 12345
Username: kenzy   Password: 121212
Username: vella   Password: 131313

7. To end, stop Visual Studio and close it.

8. In powershell go to database folder and run "destroy_db_container.ps1".

