module.exports.index = function(application, req, res){
    var connection = application.config.dbConnection();
    var model = new application.app.models.coursesDAO(connection);
    model.getAll(function(error, result){
        res.render('courses/index', {courses: result});
    });
    
}

module.exports.form = function(application, req, res){
    res.render('courses/cadastro', {validacao: {}, labs: {}});
}

module.exports.cadastrar = function(application, req, res){
    var courses = req.body;
    req.assert('name', 'Nome é obrigatorio').notEmpty();
    req.assert('description', 'Descrição é obrigatorio').notEmpty();
  
    var erros = req.validationErrors();
  
    console.log(erros);
  
    if (erros){
      res.render('courses/cadastro', {validacao: erros, labs: labs});
      return;
    }
  
    var connection = application.config.dbConnection();
    var model = new application.app.models.coursesDAO(connection); 
    
    model.create(courses, function(error, result){    
      res.redirect('/cursos');
    });
}