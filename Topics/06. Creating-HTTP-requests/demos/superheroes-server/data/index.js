const low = require('lowdb');
const storage = require('lowdb/file-sync');


module.exports = function(config) {
  const db = low(config.connectionString, {
    storage
  });
  db._.mixin(require('underscore-db'));

  return {
    superheroes: {
      save: function(superhero) {
        db('superheroes').insert(superhero);
        return superhero;
      },
      all: function() {
        return db('superheroes');
      }
    }
  };
};