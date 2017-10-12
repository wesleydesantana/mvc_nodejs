module.exports = function(app){
    
    app.get('/cadastrar-challenge', function(req, res){
      app.app.controllers.cadastrarChallengeController.formulario_challenge(app, req, res);
    });
    
    app.post('/challenges/salvar', function(req, res) {
      app.app.controllers.cadastrarChallengeController.cadastrar_challenge(app, req, res);
    });
    
    }