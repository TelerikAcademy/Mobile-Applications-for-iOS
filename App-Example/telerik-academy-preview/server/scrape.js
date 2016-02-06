'use strict';
let httpData = require('./http-data');

require('./models');
let config = require('./config')['development'];
let data = require('./data')(config.connectionString);

httpData.courses.all()
  .then(function(courses) {
    console.log(`Scraping ${courses.length} courses!`);
    courses.forEach(course => {
      console.log(`Scraping ${course.name}`);
      httpData.courses.details(course)
        .then(function(courseDetails) {
          return data.add(courseDetails)
        }, function(err) {
          console.error(err);
        })
        .then(function(courseDetails) {
          let message = `---- "${courseDetails.name}" scraped! ----`;
          let line = new Array(message.length + 1).join('-');
          console.log(line);
          console.log(message);
          console.log(line);
        });
    });
  }, function(err) {
    console.log("Bad things happen to good people...");
    console.error(err);
  });