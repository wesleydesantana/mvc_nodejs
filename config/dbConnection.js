var mysql = require('mysql');

var conecMySQL = function(){
  console.log('Conexão estabelecida');
  return mysql.createConnection(
  {
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'multitalentos'
  });
}
module.exports = function(){
  console.log('Fez o autoload do modulo de conexao');
  return conecMySQL;
} 