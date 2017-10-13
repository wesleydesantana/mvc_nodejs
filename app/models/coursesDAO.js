function CoursesDAO(connection){
    this._connection = connection;
}

CoursesDAO.prototype.getId = function(callback){
    this._connection.query('SELECT * FROM courses WHERE id = 1', callback);
}

CoursesDAO.prototype.getAll = function(callback){
    this._connection.query('SELECT * FROM courses', callback);
}

CoursesDAO.prototype.create = function(courses, callback){
   var result = this._connection.query('INSERT INTO courses SET ?', courses, callback);
    console.log(result);
}

module.exports = function(){    
    return CoursesDAO;
}