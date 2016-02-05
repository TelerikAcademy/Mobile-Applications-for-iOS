'use strict';

let express = require('express');

let app = express();

let db = require('./db');

let data = require('./data')(db);

let router = new express.Router();

router.get('/', function(req, res) {
    let page = isNaN(+req.query.page) ? 1 : +req.query.page;
    let size = isNaN(+req.query.size) ? 10 : +req.query.size;
    data.all()
      .then(function(courses) {
          courses.sort((c1, c2) => c2.date.localeCompare(c1.date));
          courses = courses.slice((page - 1) * size, page * size);
          let responseCourses = courses.map(course => {
            return {
              id: course.id,
              title: course.name
            };
          });
          res.send({
            result: responseCourses
          });
        },
        function(err) {
          res.status(400)
            .send(err);
        });
  })
  .get('/:id', function(req, res) {
    let id = req.params.id;
    data.byId(id)
      .then(function(course) {
          res.send({
            result: course
          });
        },
        function(err) {
          res.status(400)
            .send(err);
        });
  });

app.get('/check', function(req, res) {
  res.send({
    result: true
  });
})

app.use('/api/courses', router);

let port = 9002;

app.listen(port, () => console.log(`App running at ${port} at ${new Date()}`))