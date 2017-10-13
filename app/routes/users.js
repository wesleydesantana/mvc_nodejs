module.exports = function(application){
	application.get('/users', function(req, res){
		application.app.controllers.users.index(application, req, res);
	});	
		
	application.get('/perfil', function(req, res){
		application.app.controllers.users.perfil(application, req, res);
	});	
}
