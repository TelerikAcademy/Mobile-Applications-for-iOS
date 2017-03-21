'use strict';

let express = require('express');

let app = express();

let config = require('./config');

let data = require('./data')(config);

require('./config/express')(app);

require('./config/routes')(app, data);

app.listen(config.port, () => console.log(`App running at ${config.port}`));