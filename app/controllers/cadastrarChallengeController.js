module.exports.formulario_challenge = function(application, req, res){
    res.render('challenges/cadastro', {validacao: {}, challenges: {}});
}
module.exports.cadastrar_challenge = function(application, req, res){
    var challenges = req.body;
    req.assert('nome', 'Nome é obrigatorio').notEmpty();
    req.assert('descricao', 'Descrição é obrigatorio').notEmpty();
  
    var erros = req.validationErrors();
  
    console.log(erros);
  
    if (erros){
      res.render('challenges/cadastro', {validacao: erros, challenges: challenges});
      return;
    }
  
    var connection = application.config.dbConnection();
    var challengeModel = new application.app.models.challengesDAO(connection); 
    
    challengeModel.salvar(challenges, function(error, result){    
      res.redirect('/challenges');
    });
};
