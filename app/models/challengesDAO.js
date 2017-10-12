function challengesDAO(connection){
    this._connection = connection;
}

challengesDAO.prototype.getIdChallenge = function(callback){
    this._connection.query('SELECT * FROM challenges WHERE id = 1', callback);
}

challengesDAO.prototype.getChallenges = function(callback){
    this._connection.query('SELECT * FROM challenges', callback);
}

challengesDAO.prototype.salvar = function(challenges, callback){
    this._connection.query('INSERT INTO challenges SET ?', challenges, callback);
    console.log(challenges);
}

module.exports = function(){    
    return challengesDAO;
}