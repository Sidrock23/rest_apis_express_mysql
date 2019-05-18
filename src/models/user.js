'use strict';

const uuid = require('uuid/v4');

const sql = require('./db.js');

const User = function(user) {
  this.name = user.name;
  this.email = user.email;
};

User.getAllUsers = function getAllUsers(result) {
  sql.query('SELECT * from user', (err, userList) => {
    if (err) {
      console.log('Error: ', err);
      result(err, null);
    } else {
      console.log('Users: ', userList);
      result(null, userList);
    }
  });
};

User.createUser = function createUser(newUser, result) {
  const { name, email } = newUser;
  const VALUES = [uuid(), name, email];
  sql.query(
    'INSERT INTO user(id, name, email) VALUES (?, ?, ?)',
    VALUES,
    (err, res) => {
      if (err) {
        console.log('Error: ', err);
        result(err, null);
      } else {
        console.log('Query Transaction Status: ', res);
        result(null, { ...newUser, id: VALUES[0] });
      }
    }
  );
};

User.getUsersByQuestionID = function(questionID, callback) {
  sql.query(
    'SELECT * FROM userquestion WHERE question_id = ?',
    [questionID],
    function(err, res) {
      if (err) {
        console.log('Error: ', err);
        callback(err, null);
      } else {
        console.log('Query Transaction Status: ', res);
        callback(null, res);
      }
    }
  );
};
module.exports = User;
