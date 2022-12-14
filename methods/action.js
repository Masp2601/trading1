var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

var functions = {
    addNew: function (req, res) {
        if((!req.body.name) || (!req.body.password)) {
            res.json({success: false, msg: 'Ingrese todos los campos'})
        }else{
            var newUser = User({
                name: req.body.name,
                password: req.body.password
            });
            newUser.save(function (err, newUser) {
                if (err) {
                    res.json({success: false, msg:'Error al guardar'})
                }else{
                    res.json({succes: true, msg:'Exito al guardar'})
                }
            })
        }
    },
    authenticate: function (req, res) {
        User.findOne({
            name: req.body.name
        }, function (err, user) {
            if (err) throw err
            if (!user) {
                res.status(403).send({success: false, msg:'Autenticacion fallo, Usuario no existe'})
            }else{
                user.comparePassword(req.body.password, function (err, isMatch) {
                    if (isMatch && !err) {
                        var token = jwt.encode(user, config.secret)
                        res.json({success: true, token: token})
                    }else{
                        return res.status(403).send({success: false, msg: 'Autenticacion fallo, contraseña incorrecta'})
                    }
                })
            }
        })
    },
    getinfo: function (req, res) {
        if(req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            return res.json({success: true, msg: 'Hola ' + decodedtoken.name})
        }else{
            return res.json({success:false, msg: 'Sin encabezados'})
        }
    }
}

module.exports = functions