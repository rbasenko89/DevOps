const { createServer } = require('http');
const { OK } = require('http-status-codes');
const request = require('request');
const HOST =    process.env.HOST;
const PORT =   process.env.PORT;
const server = createServer(function(req,res){
    console.log(`${req.method}:${req.url}`);
    res.statusCode = 200;
});
server.listen(PORT, HOST, function(req, res){
    console.log(`server listen on ${HOST}:${PORT}`);
});
server.on('request', (request, response) => {
    // connect to the database from here which is going to be available on host DB
    // or, which is even better. connect to vault. grab the db connection string which is a secret
    // see https://www.npmjs.com/package/node-vault
    var pgp = require('pg-promise')(/* options */)
    var db = pgp('postgres://postgres:postgres@DB:5432/postgres')
    db.one('SELECT id FROM public.links AS value', 123)
      .then(function (data) {
        console.log('DATA:', data)
        response.write(JSON.stringify(data))
        response.end();
      })
      .catch(function (error) {
        console.log('ERROR:', error)
        response.write(JSON.stringify(error))
        response.end();
      })
})