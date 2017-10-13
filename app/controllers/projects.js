module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var model = new application.app.models.projectsDAO(connection);
        model.getProjects(function(error, result){
        res.render('projects/index', {projects: result});
    });
    
}

module.exports.form = function(application, req, res){
    res.render('projects/cadastro', {validacao: {}, projects: {}});
}

module.exports.cadastrar = function(application, req, res){
    var projects = req.body;
    req.assert('name', 'Nome é obrigatorio').notEmpty();
    req.assert('description', 'Descrição é obrigatorio').notEmpty();
  
    var erros = req.validationErrors();
  
    console.log(erros);
  
    if (erros){
      res.render('projects/cadastro', {validacao: erros, projects: projects});
      return;
    }
  
    var connection = application.config.dbConnection();
    var model = new application.app.models.projectsDAO(connection); 
    
    model.salvar(projects, function(error, result){    
      res.redirect('/projetos');
    });
}