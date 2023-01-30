const pool = require("../services/db")
const fs = require("fs")
const crypto = require("crypto");

module.exports = {
    home: async (req, res) => {
        res.json('Hello World')
    },

    loginUsuario: async (req, res) =>  {
        try{
            const {email, password} = req.body;
            const result = await pool.query('SELECT (correo_usuario,celular) FROM usuario WHERE correo_usuario=$1 and celular=$2', [email,password])
            if(result.rows.length > 0)
                res.send(req.body)
            else
                res.status(401).send(JSON.stringify('Unauthorized'))
        }catch(error){
            res.status(500).send(JSON.stringify(error))
        }
    },

    loginTrab: async (req,res) => {
        try{
            const {email, password} = req.body;
            const result = await pool.query('SELECT (correo_trabajador,celular) FROM trabajador WHERE correo_trabajador=$1 and celular=$2', [email,password])
            if(result.rows.length > 0)
                res.send(req.body)
            else
                res.status(401).send(JSON.stringify('Unauthorized'))
        }catch(error){
            res.status(500).send(JSON.stringify(error))
        }
    },

    crearUsuario: async (req, res) => {
        try{
            const {nombre, apellido, direccion, email, celular, recibo, mediopago} = req.body

            const imageBuffer = decodeBase64Image(recibo)
            const [,type] = recibo.split(';')[0].split('/')
            const imageId = crypto.randomBytes(8).toString("hex")

            const imageRoute = `uploads/recibo/${imageId}.${type}`
            
            fs.writeFile(imageRoute, imageBuffer.data, 'base64', function(err) {
                if(err){
                    console.log('Error uploading image')
                }
            });

            const personaInsert = await pool.query('INSERT INTO persona (nombre, apellido, direccion, ciudad, fecha_nacimiento) VALUES ($1, $2, $3, $4, $5) RETURNING id_persona', [nombre, apellido, direccion, 'Cali', new Date()])
            const personaId = personaInsert.rows[0].id_persona

            const usuarioInsert = await pool.query('INSERT INTO usuario (id_persona, correo_usuario, celular, recibo_usuario) VALUES ($1, $2, $3, $4)', [personaId, email, celular, imageRoute])

            res.send(JSON.stringify('Usuario creado correctamente'))

        }catch(error){
            res.status(500).send(JSON.stringify(error))
            console.log(error)
        }
    },
    crearTrabajador: async (req, res) => {
        try{
            const {nombre, apellido, direccion, email, celular, documento} = req.body

            const imageBuffer = decodeBase64Image(documento)
            const [,type] = documento.split(';')[0].split('/')
            const imageId = crypto.randomBytes(8).toString("hex")

            const imageRoute = `uploads/documentoid/${imageId}.${type}`
            
            fs.writeFile(imageRoute, imageBuffer.data, 'base64', function(err) {
                if(err){
                    console.log('Error uploading image')
                }
            });

            const personaInsert = await pool.query('INSERT INTO persona (nombre, apellido, direccion, ciudad, fecha_nacimiento) VALUES ($1, $2, $3, $4, $5) RETURNING id_persona', [nombre, apellido, direccion, 'Cali', new Date()])
            const personaId = personaInsert.rows[0].id_persona

            const trabajadorInsert = await pool.query('INSERT INTO trabajador (id_persona, correo_trabajador, celular, cedula_trabajador, disponibilidad) VALUES ($1, $2, $3, $4, $5)', [personaId, email, celular, imageRoute, 'si'])

            res.send(JSON.stringify('Trabajador creado correctamente'))

        }catch(error){
            res.status(500).send(JSON.stringify(error))
            console.log(error)
        }
    }
}

function decodeBase64Image(dataString) {
    var matches = dataString.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/),
      response = {};
  
    if (matches.length !== 3) {
      return new Error('Invalid input string');
    }
  
    response.type = matches[1];
    response.data = Buffer.from(matches[2], 'base64');
  
    return response;
}