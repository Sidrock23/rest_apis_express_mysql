### Setting up this repository:

- Make sure you have installed **node** and **mysql** (probably, the community edition) installed globally.

- Initialize the MYSQL DB by following the steps mentioned in the [next section: How to initialize DB](#how-to-initialize-db).

- In the root location of this repository, execute the following commands:
  - Install the node modules.
    ```
    > npm install
    ```
  - Start the node server.
    ```
    > npm run start
    ```
    This starts a node server at http://127.0.0.1:3000/. And, when you go to the browser and hit the same URL, you'll see a _welcome_ message on UI.
- Start hitting the APIs available [here](#apis-available) to see the project status.

### How to initialize DB:

- Create a .env file in the root location containing the following contents:
  ```sh
  DB_HOSTNAME=localhost
  DB_USER_NAME=<the user who is logging into the mysql client, e.g. 'root'>
  DB_PASSWORD=<the db-user password for the user mentioned in previous line>
  DB_NAME=nthexam
  ```
- Log in to the mysql-cli (here, login into the mysql client via the `root` user with password prompt)
  ```sh
  > mysql -u root -p
  ```

- Create a database named **nthexam** from mysql-cli
  ```sql
  mysql> create database nthexam;
  ```

- Exit the **mysql-cli** via `exit` command. 
  ```sql
  mysql> exit
  ```
- From the root of this project, run the following npm script in the terminal:
  ```js
  > npm run init:db nthexam
  ```

  This 👆🏻 command with create the required tables, with proper schema and some mocked dummy data.

**Note:** to reset the database(dropping the db and initializing the db with mock data from the sql dump file), run the command ``npm run init:db nthexam`` 
### APIs available:

| METHOD | ROUTE                        | PARAMS(route/query) | BODY                            | DESCRIPTION                                                                |
| ------ | ---------------------------- | ------------------- | ------------------------------- | -------------------------------------------------------------------------- |
| GET    | /                            | -                   | -                               | Returns a welcome message.                                                 |
| GET    | /users                       | -                   | -                               | Returns the list of users stored in DB.                                    |
| POST   | /users                       | -                   | { name: string, email: string } | Creates a new user in the DB.                                              |
| GET    | /exams/:examID/questions     | examID              | -                               | Returns questions for a particular exam with id as `examID`.               |
| GET    | /questions/:questionID/users | questionID          | -                               | Returns users who attempted a particular question with id as `questionID`. |
| GET    | /users/:userID/questions     | userID              | -                               | Returns questions that a user with id as `userID` attempted.               |
| GET    | /questions/:questionID     | questionID              | -                               | Returns information about a particular question with id as `questionID`.               |
