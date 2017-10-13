module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var model = new application.app.models.labsDAO(connection);
    model.getAll(function(error, result){
        res.render('labs/index', {labs: result});
    });
    
}

module.exports.form = function(application, req, res){
    res.render('labs/cadastro', {validacao: {}, labs: {}});
}

module.exports.cadastrar = function(application, req, res){
    var labs = req.body;
    req.assert('name', 'Nome é obrigatorio').notEmpty();
    req.assert('description', 'Descrição é obrigatorio').notEmpty();
  
    var erros = req.validationErrors();
  
    console.log(erros);
  
    if (erros){
      res.render('labs/cadastro', {validacao: erros, labs: labs});
      return;
    }
  
    var connection = application.config.dbConnection();
    var model = new application.app.models.labsDAO(connection); 
    
    model.create(labs, function(error, result){    
      res.redirect('/labs');
    });
}