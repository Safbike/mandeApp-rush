const {Pool} = require('pg')

const pool = new Pool({ 
    "user": "postgres", 
    "database": "postgres", 
    "password": "1234",
    "host": "localhost",
    "port":"5432",
    "max": 10, 
    "idleTimeoutMillis": 30000, 
})

module.exports=pool