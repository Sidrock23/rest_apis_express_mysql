'use strict';

const sql = require('./db.js');

const Question = function(question) {
  this.description = question.description;
  this.answer = question.answer;
  this.exam_id = question.exam_id;
};

Question.getQuestionsByExamID = function(examID, result) {
  sql.query('SELECT * FROM question WHERE exam_id=?', [examID], function(
    err,
    response
  ) {
    if (err) {
      console.log('Error: ', err);
      result(err, null);
    } else {
      console.log('Query Transaction Status: ', response);
      result(null, response);
    }
  });
};

Question.getQuestionsByUserID = function(userID, result) {
  sql.query('SELECT * FROM userquestion WHERE user_id=?', [userID], function(
    err,
    response
  ) {
    if (err) {
      console.log('Error: ', err);
      result(err, null);
    } else {
      console.log('Query Transaction Status: ', response);
      result(null, response);
    }
  });
};

Question.getQuestionData = function (questionID, callback) {
  sql.query('SELECT * FROM question WHERE id=?', [questionID], function(
    err,
    response
  ) {
    if (err) {
      console.log('Error: ', err);
      callback(err, null);
    } else {
      console.log('Query Transaction Status: ', response);
      callback(null, response);
    }
  });
}

module.exports = Question;
