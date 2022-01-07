Database setup (I suggest you use HeidiSQL or similar to make import easier):
1. Create a database called trump
2. Load the trump.sql file
3. Check that the tables have installed properly

Application:
1. Open the project in Netbeans
2. In Services, create a new JDBC driver with the following dburl:
	-jdbc:mysql://localhost:3306/trump?useSSL=false&allowPublicKeyRetrieval=true
	-Make sure the driver is connected before proceeding.
3. Clean and build the project
4. Run the project
5. Enjoy :)