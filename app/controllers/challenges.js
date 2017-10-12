module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var challengeModel = new application.app.models.challengesDAO(connection);
    challengeModel.getChallenges(function(error, result){
        res.render('challenges/index', {challenges: result});
    });
    
}



