const express = require('express');
const UserModel = require('./Models/UserModel');
const MessModel = require('./Models/MessModel');
let jwt = require('jsonwebtoken');

let JWT_KEY_og = "bcvweuweuyaacvuyweopkqwcnqwhcvybcvcuywecgbw";

async function checkIfLoggedfun(req, res, next) {
    const authorizationHeader = req.headers['authorization'];
  
    if (authorizationHeader && authorizationHeader.startsWith('Bearer ')) {
      const token = authorizationHeader.substring(7);
  
      try {
        //console.log(token);
        const verify = jwt.verify(token, JWT_KEY_og);
        req.id = verify.payload;
  
        const user = await UserModel.findOne({ _id: req.id });
  
        if (user) {
          req.userdata = user;
          next();
        } else {
          res.status(500).send("Please log in to continue...");
        }
      } catch (error) {
        res.status(401).send("User not verified or invalid token");
      }
    } else {
      res.status(401).send("Please provide a valid token in the Authorization header");
    }
  }

function checkrolefun(roleNeeded){
    return function (req, res, next) {
        if (roleNeeded.includes(req.userdata.role)) {
            next();
        }
        else {
            res.send("You are Not authorized to view this page..");
        }
    }
}

function checkownershipfun(req,res,next){
    if (req.userdata.mess.includes(req.params.mid)) {
        next();
    }
    else {
        res.send("You are not authorized to visit this mess page..");
    }
}

function checkownership_planfun(req,res,next) {
    if (req.userdata.mess.includes(req.params.mid)) {
        next();
    }
    else {
        res.send("You are not authorized to add a plan to this mess");
    }
}

function checkmessplan_fun(req,res,next){
    MessModel.findOne({_id:req.params.mid}).then((data)=>{
        if(data.plans.includes(req.params.pid)){
            next();
        }
        else{
            res.send("your mess does not contain any plan like this..");
        }
    });
}

module.exports = {
    checkIfLogged: checkIfLoggedfun,
    checkrole: checkrolefun,
    JWT_KEY: JWT_KEY_og,
    checkownership:checkownershipfun,
    checkownership_plan:checkownership_planfun,
    checkmessplan:checkmessplan_fun,
}


/* git commands
git status
git add .
git commit -m "Second Commit"
git push
*/