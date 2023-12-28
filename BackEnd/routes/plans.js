let express = require('express');
let {Plancreate,Planupdate,Plandelete,Viewsubs} = require('../ModuleControllers/PlanController');
let PlanRouter = express.Router();
let jwt = require('jsonwebtoken');
let {checkIfLogged,checkrole,checkownership_plan,checkmessplan}=require('../utils');

PlanRouter.use(checkIfLogged);
PlanRouter.use(checkrole(['seller','admin']));

PlanRouter
.route('/:mid&:pid')
.patch(checkownership_plan,checkmessplan,Planupdate)
.delete(checkownership_plan,checkmessplan,Plandelete);

PlanRouter
.route('/viewsubs/:mid&:pid')
.get(checkownership_plan,checkmessplan,Viewsubs);

module.exports=PlanRouter;