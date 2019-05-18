const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const HOSTNAME = '127.0.0.1';
const PORT = 3000;
const mysql = require('mysql');
const routes = require('./src/routes/index.js');

// Allows accessing env variables via process.env
const dotenv = require('dotenv');
dotenv.config();

const { DB_HOSTNAME, DB_USER_NAME, DB_PASSWORD, DB_NAME } = process.env;

const mc = mysql.createConnection({
  host: DB_HOSTNAME,
  user: DB_USER_NAME ,
  password: DB_PASSWORD,
  database: DB_NAME
});

mc.connect();

app.listen(
  PORT,
  () => `Node server is up and running at http://${HOSTNAME}:${PORT}/`
);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Register routes to the app
routes(app);


