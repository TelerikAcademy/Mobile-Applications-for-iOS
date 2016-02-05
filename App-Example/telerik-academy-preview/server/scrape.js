'use strict';
let data = require('./http-data');

let db = require('./db');

db('courses').remove({});

data.courses.all()
  .then(function(courses) {
    console.log(`Scraping ${courses.length} courses!`);
    // courses = courses.slice(0, 3);
    courses.forEach(course => {
      console.log(`Scraping ${course.name}`);
      data.courses.details(course)
        .then(function(courseDetails) {
          db('courses').push(courseDetails);
        }, function(err) {
          console.error(err);
        });
    });
  }, function(err) {
    console.log("Bad things happen to good people...");
    console.error(err);
  });