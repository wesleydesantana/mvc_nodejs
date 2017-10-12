function usersDAO(connection){
    this._connection = connection;
}

usersDAO.prototype.getIdUser = function(callback){
    this._connection.query('SELECT * FROM users WHERE id_user = 1', callback);
}

usersDAO.prototype.getUsers = function(callback){
    this._connection.query('SELECT * FROM users', callback);
}

usersDAO.prototype.getUsersLimit = function(callback) {
    this._connection.query('SELECT * FROM users LIMIT 5', callback);
}; 


usersDAO.prototype.salvar = function(challenges, callback){
    this._connection.query('INSERT INTO users SET ?', challenges, callback);
    console.log(challenges);
}

module.exports = function(){    
    return usersDAO;
}