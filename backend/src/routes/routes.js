const {Router} = require('express');
const pool = require('../services/db');
const { home, crearUsuario, crearTrabajador, loginUsuario, loginTrab} = require('../controllers/routes.controller')
const router = Router();

router.get('/',home)

router.post('/crearusuario',crearUsuario)
router.post('/creartrabajador',crearTrabajador)
router.post('/loginsusuario', loginUsuario)
router.post('/logintrab', loginTrab)

module.exports = router;