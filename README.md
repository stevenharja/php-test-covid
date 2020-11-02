# Using the application

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app). This is the application used for PHP Full Stack Developer role test, and below are the guidelines to using the application. **Make sure to install all the required packages before using the application: npm i / npm install**

## Preparation Before Using The Application

Before using the application, there are several settings that must be done to ensure that the application perform as intended.

### `Connect To Local Database`

During the development, this application is connected to WAMP's local server and phpMyAdmin, which means putting the folder of php-test-covid in wamp64/www (Should result in the path of wamp64/www/php-test-covid)

After putting the folder in the directory mentioned, there is the supplied sql to re-create the table in the exported_sql folder (coviddata.sql). The database name is "coviddata", while the table name is "lga_data" which you can see in the sql mentioned above.

### `Modify PHP configuration`

If the name of the database or the table somehow was modified or change you can easily modify it by changing the name in src/api/db_connection.php, where you can see $databaseName and $tableName. By changing these two variables, other API calls will follow the variable name that you have set out in the db_connection.php (currently $databaseName = "coviddata"; $tableName = "lga_data";). **Also ensure to modify the dbhost, dbuser, dbpass according to your setup (My host is localhost with the user "root" and password "stevenharjapramana**

### `Setup Database Table`

To setup the database, it is recommended to use the provided sql in exported_sql/coviddata.sql. It will create the table that replicates the desired state for the application, and to change the data (to a newer date for example), you can do so by exporting the data in the application seen below.

### `Export Data to application`

To export the data the application, make sure that the first two step above has been completed and you can export in two ways: Export the data from provided SQL in the exported_sql directory or Export using the application's settings by running the script below (npm start), and uploading the LGA CSV file into the application and submit it to the database. This will process the data accordingly **as long as the table has been set**. If you want to check the chart of the data beforehand you can do so by using the Show Local Data To Chart

## Available Scripts

In the project directory, you can run:

### `npm start` - Start The Application

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.
Contains the application front-end, this needs to run in order to work with the application.

The page will reload if you make edits.\
You will also see any lint errors in the console.
