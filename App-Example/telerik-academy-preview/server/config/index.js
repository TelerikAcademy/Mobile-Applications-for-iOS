module.exports = {
  development: {
    port: 9002,
    connectionString: 'mongodb://localhost/telerik-academy-courses'
  },
  production: {
    port: process.env.PORT,
    connectionString: 'mongodb://...'
  }
};