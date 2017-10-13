function labsDAO(connection){
    this._connection = connection;
}

labsDAO.prototype.getId = function(callback){
    this._connection.query('SELECT * FROM labs WHERE id = 1', callback);
}

labsDAO.prototype.getAll = function(callback){
    this._connection.query('SELECT * FROM labs', callback);
}

labsDAO.prototype.create = function(labs, callback){
   var result = this._connection.query('INSERT INTO labs SET ?', labs, callback);
    console.log(result);
}

module.exports = function(){    
    return labsDAO;
}