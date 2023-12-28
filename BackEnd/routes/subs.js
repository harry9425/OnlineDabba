let express = require('express');
let {Subscreate,Subsdelete} = require('../ModuleControllers/SubsController');
let SubsRouter = express.Router();
let jwt = require('jsonwebtoken');
let {checkIfLogged,checkrole,checkownership_plan,checkmessplan}=require('../utils');

SubsRouter.use(checkIfLogged);
SubsRouter.use(checkrole(['user','admin']));

SubsRouter.route('/plan/:pid').post(Subscreate);
SubsRouter.route('/:sid').delete(Subsdelete);

module.exports=SubsRouter;