'use strict';

let mongoose = require('mongoose');

module.exports = function(connectionString) {
  mongoose.connect(connectionString);
  let Course = mongoose.model('Course');

  return {
    all: function() {
      let promise = new Promise(function(resolve, reject) {
        Course.find()
          .exec(function(err, courses) {
            if (err) {
              return reject(err);
            }
            return resolve(courses);
          });
      });
      return promise;
    },
    byId: function(id) {
      let promise = new Promise(function(resolve, reject) {
        Course.findById(id)
          .exec(function(err, course) {
            if (err) {
              return reject(err);
            }
            return resolve(course);
          });
      });
      return promise;
    },
    add: function(course) {
      let promise = new Promise(function(resolve, reject) {
        let dbCourse = new Course(course);
        dbCourse.save(function(err) {
          if (err) {
            return reject(err);
          }
          return resolve(dbCourse);
        });
      });
      return promise;
    }
  };
};