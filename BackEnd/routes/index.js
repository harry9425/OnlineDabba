var express = require('express');
var router = express.Router();
let {Resetpass} = require('../ModuleControllers/AuthController');

/* GET home page. */

router.route('/resetpassword/:token').post(Resetpass);

router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.use(function(req,res,next){
  res.send("404 sorry route never matched");
})

module.exports = router;
