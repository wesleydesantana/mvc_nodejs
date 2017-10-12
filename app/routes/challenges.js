module.exports = function(application){
	application.get('/challenges', function(req, res){
		application.app.controllers.challenges.index(application, req, res);
	});

	application.get('/cadastrar-challenge', function(req, res){
		application.app.controllers.challenges.formulario_challenge(application, req, res);
	  });
	  
	  application.post('/challenges/salvar', function(req, res) {
		application.app.controllers.challenges.cadastrar_challenge(application, req, res);
	});
	
}
