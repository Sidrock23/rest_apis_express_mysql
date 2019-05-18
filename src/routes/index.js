const userControllers = require('../controllers/user');
const questionControllers = require('../controllers/question');

module.exports = function(app) {
  app
    .route('/users')
    .get(userControllers.getAllUsers)
    .post(userControllers.createUser);

  app
    .route('/exams/:examID/questions')
    .get(questionControllers.getQuestionsByExamID);

  app
    .route('/questions/:questionID')
    .get(questionControllers.getQuestionData)

  app
    .route('/questions/:questionID/users')
    .get(userControllers.getUsersByQuestionID);

  app
    .route('/users/:userID/questions')
    .get(questionControllers.getQuestionsByUserID);

  app.route('/').get((req, res, next) => {
    res.send(`Welcome to the '/' location of this nthexam backend assignment.`);
  });
};
