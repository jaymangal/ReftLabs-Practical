1. Import the database to database.sql
2. configure the env file with database credentials

## Installation

Open a terminal window session, and enter the following command to install all the Node modules needed to run the app:

- npm install

## Run the app in development mode

After doing an `npm install` enter the following `npm run` command:

- npm run start

## API server is listening on

This will start the app and set it up to listen for incoming connections on port 8000. Open up your browser of choice and go to the url [http://localhost:8000/](http://localhost:8000/) to start using the app itself. The `npm run dev` command automatically runs the app using the `nodemon` script so any changes you make to the app's javascript, CSS or HTML code will automatically restart it.

## Customizing the listening port

To configure the port that the app listens on at startup, to `.env` and set an appropriate value for the `PORT` environment variable listed in the file. This must be done before the app is started.