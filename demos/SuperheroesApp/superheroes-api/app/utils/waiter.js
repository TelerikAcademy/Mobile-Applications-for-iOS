const Observable = require("rx").Observable;

module.exports = (time) => {
    return Observable.of(true)
        .delay(time * 1000)
};