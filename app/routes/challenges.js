module.exports = function(application){
	application.get('/challenges', function(req, res){
		application.app.controllers.challenges.index(application, req, res);
	});

	
}
