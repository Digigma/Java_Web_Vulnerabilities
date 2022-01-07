# Java_Web_Vulnerabilities

The purpose of this assignment is to secure vulnerable source code in the application provided and provide a report on how you achieved this.
You will be supplied with a simple Web application. The app is coded using JSP and connects to a MySQL backend database. There are two parts to the assignment: demonstrate the exploits (show using screenshots and a description how the application is vulnerable in the source code) and then fix the code.
You need to find weaknesses, exploit them, and finally fix them. For the first part of your assignment you need to analyse the code and look for possible weaknesses. You then need to try exploit any weakness you think you have identified. For example, if you think a form field is vulnerable to XSS, then perform some attack to show the weakness.
(Only one example vulnerability, per location, each field, is required and will be considered as a fix. In other words, you won’t get any more marks for fixing a SQL injection vulnerability in several places).
For the second part of the assignment, you must try to secure the code, by correcting any flaws you find by writing new secure code.
Setup
NOTE: there is a readme.txt file in the zipped folder. Firstly, you’ll need to get the code running so you can test it. Set up the database first. I have supplied a SQL script to create the database tables. You need to create a DB in MySQL. I suggest you use a GUI tool like HeidiSQL (https://www.heidisql.com/) You can run the script in Heidi and it will import the tables into the empty DB you created. Alternatively, you can use the MySQL command line to create a DB and then import the tables using the source command, e.g.
source C:\Users\Hannah\Desktop\<table-name>.sql
Where <table-name> is the name of the SQL script.
Follow the instructions in the ReadMe to configure the project before you run it.
