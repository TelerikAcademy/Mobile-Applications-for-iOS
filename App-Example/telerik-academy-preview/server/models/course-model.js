'use strict';

let mongoose = require('mongoose'),
  Schema = mongoose.Schema;

let courseSchema = new Schema({
  name: String,
  link: String,
  date: Date,
  description: String,
  topics: [Schema.Types.Mixed]
});

mongoose.model('Course', courseSchema);