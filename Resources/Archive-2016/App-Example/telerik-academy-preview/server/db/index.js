'use strict';

let low = require('lowdb')
let storage = require('lowdb/file-sync')
let db = low('./db/db.json', {
    storage
  })
  // db._.mixin(require('underscore-db'))

module.exports = db;