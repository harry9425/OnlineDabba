let express = require('express');
let { Usersignup, Userlogin,Forgetpass,Resetpass,Userlogout} = require('../ModuleControllers/AuthController');
let { Userprofile, Updateprofile, Deleteprofile, Getall,Viewsubs} = require('../ModuleControllers/UserController');
let UserRouter = express.Router();
let jwt = require('jsonwebtoken');
let {checkIfLogged,checkrole}=require('../utils');
let UserModel = require('../Models/UserModel');

UserRouter.route('/signup').post(Usersignup);

UserRouter.route('/login').post(Userlogin);

UserRouter.route('/forgetpassword').post(Forgetpass);

UserRouter.use(checkIfLogged);

UserRouter.route('/logout').get(Userlogout);

UserRouter.route('/profile')
  .get(Userprofile)
  .patch(Updateprofile)
  .delete(Deleteprofile);

UserRouter.route('/viewsubs').get(Viewsubs);

UserRouter.use(checkrole(['admin']));

UserRouter.route('/')
  .get(Getall);

module.exports = UserRouter;
