function challengesDAO(connection){
    this._connection = connection;
}

challengesDAO.prototype.getId = function(callback){
    this._connection.query('SELECT * FROM challenges WHERE id = 1', callback);
}

challengesDAO.prototype.getAll = function(callback){
    this._connection.query('SELECT * FROM challenges', callback);
}

challengesDAO.prototype.create = function(challenges, callback){
   var result = this._connection.query('INSERT INTO challenges SET ?', challenges, callback);
    console.log(result);
}

module.exports = function(){    
    return challengesDAO;
}