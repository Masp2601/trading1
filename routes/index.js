const express = require('express')
const actions = require('../methods/action')
const router  = express.Router()

router.get('/', (req, res) => {
    res.send('hello world')
})

//agegar usuario nuevo
router.post('/adduser', actions.addNew)
//autenticar usuario
router.post('/authenticate', actions.authenticate)
// get informacion de usuraio
router.get('/getinfo', actions.getinfo)


module.exports = router