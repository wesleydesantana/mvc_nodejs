module.exports = function(application){
	application.get('/projetos', function(req, res){
		application.app.controllers.projects.index(application, req, res);
    });
    
    application.get('/cadastrar-projetos', function(req, res){
		application.app.controllers.projects.form(application, req, res);
      });
      
      application.post('/projetos/salvar', function(req, res) {
		application.app.controllers.projects.cadastrar(application, req, res);
	});
	
}
