'use strict';

let cheerio = require('cheerio'),
  request = require('request'),
  moment = require('moment');

module.exports = {
  all: function() {
    let url = 'http://www.telerikacademy.com';
    let promise = new Promise(function(resolve, reject) {
      let options = {
        url: url
      };

      request(options, function(error, response, body) {
        if (error) {
          return reject(error);
        }

        if (response.statusCode !== 200) {
          return reject({
            message: 'Something is not right!'
          });
        }

        let $ = cheerio.load(body.toString());
        let $navItems = $('#Menu a');
        let courses = [];

        $navItems.each(function(_, item) {
          let $item = $(item);
          let href = $item.attr('href');
          if (href.indexOf('/Courses/Courses/Details/') >= 0) {
            let id = href.substr(href.lastIndexOf('/') + 1);
            courses.push({
              id: id,
              name: $item.text().trim()
            });
          }
        });
        resolve(courses);
      })
    });
    return promise;
  },
  details: function(course) {
    let url = `http://telerikacademy.com/Courses/Courses/Details/${course.id}`;
    let promise = new Promise(function(resolve, reject) {
      let options = {
        url: url
      };

      request(options, function(error, response, body) {
        if (error) {
          return reject(error);
        }

        if (response.statusCode !== 200) {
          return reject({
            message: 'Something is not right!'
          });
        }

        let $ = cheerio.load(body.toString());
        let courseDetails = {};
        let dateString = $('.courseGreyContainer.courseTimespanInfo strong').text();

        // courseDetails.id = course.id;
        courseDetails.name = course.name
        courseDetails.link = url;
        courseDetails.date = moment(dateString);
        courseDetails.description = (function() {
          let desc = '';
          var $desc = $('.descriptionContainer p');
          $desc.each((_, descItem) => {
            desc += $(descItem).text().trim();
          });
          return desc.trim();
        }());

        courseDetails.topics = (function() {
          let $rows = $('.table tbody tr');
          let topics = [];
          $rows.each((index, row) => {
            let $row = $(row);
            let resources = [];
            $row.find('.resourceContainer a').each((i, resourceEl) => {
              let resource = {
                title: $(resourceEl).text().trim(),
                link: $(resourceEl).attr('href').trim()
              };
              resources.push(resource);
              // console.log(`------------${resource}`);
            });

            topics.push({
              order: index,
              title: $row.find('td').eq(0).text().trim(),
              resources: resources
            });
          });
          return topics;
        }());

        resolve(courseDetails);
      });
    });
    return promise;
  }
};