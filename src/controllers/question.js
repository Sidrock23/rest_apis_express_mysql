const QuestionModel = require('../models/question.js');

exports.getQuestionsByExamID = function(req, res) {
  const { examID } = req.params;
  if (!examID) {
    res.status(400).send({
      error: true,
      message: 'Please provide a valid exam_id.'
    });
  } else {
    QuestionModel.getQuestionsByExamID(examID, function(err, questions) {
      if (err) {
        res.send(err);
      } else if (questions.length === 0) {
        res.send('Could not find questions for this exam.');
      } else {
        res.json(questions);
      }
    });
  }
};

exports.getQuestionsByUserID = function(req, res) {
  const { userID } = req.params;
  if (!userID) {
    res.status(400).send({
      error: true,
      message: 'Please provide a valid user_id.'
    });
  } else {
    QuestionModel.getQuestionsByUserID(userID, function(err, questions) {
      if (err) {
        res.send(err);
      } else if (questions.length === 0) {
        res.send('Could not find questions for this user.');
      } else {
        res.json(questions);
      }
    });
  }
};

exports.getQuestionData = function(req, res) {
  const { questionID } = req.params;
  if (!questionID) {
    res.status(400).send({
      error: true,
      message: 'Please provide a valid question_id.'
    });
  } else {
    QuestionModel.getQuestionData(questionID, function(err, questions) {
      if (err) {
        res.send(err);
      } else if (questions.length === 0) {
        res.send('Could not find information for this question.');
      } else {
        res.json(questions);
      }
    });
  }
};
