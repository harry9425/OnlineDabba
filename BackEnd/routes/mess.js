let express = require('express');
let {Messcreate,Messupdate,Messget,Messgetall,Messdelete,MessgetallSpecific,Viewsubs} = require('../ModuleControllers/MessController');
let MessRouter = express.Router();
let jwt = require('jsonwebtoken');
let {checkIfLogged,checkrole,checkownership}=require('../utils');

MessRouter.route('/fetchall').get(Messgetall);
MessRouter.route('/view/:mid').get(Messget);

MessRouter.use(checkIfLogged);
MessRouter.use(checkrole(['seller','admin']));

MessRouter.route('/fetchmine').get(MessgetallSpecific);

MessRouter.route('/').post(Messcreate);

MessRouter.route('/viewsubs/:mid')
.get(checkownership,Viewsubs);

MessRouter.route('/:mid')
.patch(checkownership,Messupdate)
.delete(checkownership,Messdelete);

module.exports=MessRouter;