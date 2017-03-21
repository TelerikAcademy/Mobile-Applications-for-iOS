'use strict';

let express = require('express');

module.exports = function(app, data) {
  let router = new express.Router();

  router.get('/', function(req, res) {
      res.send({
        result: data.superheroes.all()
      });
    })
    .post('/', function(req, res) {
      res.send({
        result: data.superheroes.save(req.body)
      });
    });

  app.use('/api/superheroes', router);
};