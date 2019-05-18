const shell = require('shelljs');

// Allows accessing env variables via process.env
const dotenv = require('dotenv');
dotenv.config();

const { DB_USER_NAME } = process.env;
// Choose the db name from npm script argument if it exists else use from .env
const DB_NAME = process.argv[2] || process.env.DB_NAME;
shell.exec(`./scripts/db/init.sh ${DB_USER_NAME} ${DB_NAME}`, (code, stdout, stderr) => {
  if (code === 0) {
    console.log('Database was successfully initialized.')
  } else {
    console.log('Exit code:', code);
    console.log('Program output:', stdout);
    console.log('Program stderr:', stderr);
  }
});