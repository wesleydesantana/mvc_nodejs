module.exports = function(application){
	application.get('/cursos', function(req, res){
		application.app.controllers.courses.index(application, req, res);	});


		application.get('/cadastrar-cursos', function(req, res){
			application.app.controllers.courses.form(application, req, res);
		  });
		  
		  application.post('/courses/salvar', function(req, res) {
			application.app.controllers.courses.cadastrar(application, req, res);
		});
}