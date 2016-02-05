'use strict';

module.exports = function(db) {
  return {
    all: function() {
      let promise = new Promise(function(resolve, reject) {
        let courses = db('courses').value();
        console.log(courses);
        resolve(courses);
      });
      return promise;
    },
    byId: function(id) {
      let promise = new Promise(function(resolve, reject) {
        let course = db('courses').find({
          id: id
        });
        resolve(course);
      });
      return promise;
    }
  };
};