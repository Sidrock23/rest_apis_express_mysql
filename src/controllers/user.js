const UserModel = require('../models/user.js');

exports.getAllUsers = function(req, res) {
  UserModel.getAllUsers(function(err, users) {
    if (err) {
      console.log('Error: ', err);
      res.send(err);
    } else {
      res.send(users);
    }
  });
};

const isUserValid = ({ name, email }) => !(!name || !email);

exports.createUser = function(req, res) {
  const newUser = new UserModel(req.body);
  const userValid = isUserValid(newUser);
  if (!userValid) {
    res.status(400).send({
      error: true,
      message: 'Please provide valid parameters(name and email) for creating a user.'
    });
  } else {
    UserModel.createUser(newUser, function(err, newUser) {
      if (err) {
        res.send(err);
      } else {
        res.json(newUser);
      }
    });
  }
};

exports.getUsersByQuestionID = function(req, res) {
  const { questionID } = req.params;
  if (!questionID) {
    res.status(400).send({
      error: true,
      message: 'Please provide correct parameters for creating a user.'
    });
  } else {
    UserModel.getUsersByQuestionID(questionID, function(err, users) {
      if (err) {
        res.send(err);
      } else {
        res.json(users);
      }
    });
  }
};
