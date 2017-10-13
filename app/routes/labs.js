module.exports = function(application){
	application.get('/labs', function(req, res){
		application.app.controllers.labs.index(application, req, res);	});


		application.get('/cadastrar-lab', function(req, res){
			application.app.controllers.labs.form(application, req, res);
		  });
		  
		  application.post('/labs/salvar', function(req, res) {
			application.app.controllers.labs.cadastrar(application, req, res);
		});
}