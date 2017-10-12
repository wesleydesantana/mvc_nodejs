module.exports.home = function(application, req, res){
    var connection = application.config.dbConnection();
    var userModel = new application.app.models.usersDAO(connection);

    
    userModel.getUsersLimit(function(error, result){
        res.render('home/index', {users: result});
    });

    
}
