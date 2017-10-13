module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var challengeModel = new application.app.models.challengesDAO(connection);
    challengeModel.getAll(function(error, result){
        res.render('challenges/index', {challenges: result});
    });
    
}

module.exports.formulario_challenge = function(application, req, res){
    res.render('challenges/cadastro', {validacao: {}, challenges: {}});
}
module.exports.cadastrar_challenge = function(application, req, res){
    var challenges = req.body;
    req.assert('name', 'Nome é obrigatorio').notEmpty();
    req.assert('description', 'Descrição é obrigatorio').notEmpty();
  
    var erros = req.validationErrors();
  
    console.log(erros);
  
    if (erros){
      res.render('challenges/cadastro', {validacao: erros, challenges: challenges});
      return;
    }
  
    var connection = application.config.dbConnection();
    var challengeModel = new application.app.models.challengesDAO(connection); 
    
    challengeModel.create(challenges, function(error, result){    
      res.redirect('/challenges');
    });
};


