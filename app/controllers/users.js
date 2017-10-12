module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var userModel = new application.app.models.usersDAO(connection);
    userModel.getUsers(function(error, result){
        res.render('users/index', {users: result});
    });
    
}

module.exports.perfil = function(application, req, res){
    var connection = application.config.dbConnection();
    var userModel = new application.app.models.usersDAO(connection);
    userModel.getIdUser(function(error, result){
        res.render('users/perfil', {users: result});
    });
    
}




