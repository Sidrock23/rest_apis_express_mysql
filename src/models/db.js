'use strict';

const mysql = require('mysql');
// Allows accessing env variables via process.env
const dotenv = require('dotenv');
dotenv.config();

const { DB_HOSTNAME, DB_USER_NAME, DB_PASSWORD, DB_NAME } = process.env;

const connection = mysql.createConnection({
  host: DB_HOSTNAME,
  user: DB_USER_NAME ,
  password: DB_PASSWORD,
  database: DB_NAME
});

connection.connect(err => {
  if (err) throw err;
  console.log(
    `Successfully connected to MYSQL DB with connection threadID: ${
      connection.threadId
    }`
  );
});

// Export the DB connection wrapper
module.exports = connection;
