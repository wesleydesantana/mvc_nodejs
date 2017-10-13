function projectsDAO(connection){
    this._connection = connection;
}

projectsDAO.prototype.getId = function(callback){
    this._connection.query('SELECT * FROM projects WHERE id = 1', callback);
}

projectsDAO.prototype.getAll = function(callback){
    this._connection.query('SELECT * FROM projects', callback);
}

projectsDAO.prototype.create = function(projects, callback){
   var result = this._connection.query('INSERT INTO projects SET ?', projects, callback);
    console.log(result);
}

module.exports = function(){    
    return projectsDAO;
}