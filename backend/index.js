const express = require('express')
const morgan = require('morgan')
const cors = require('cors')

const taskRoutes = require('./src/routes/routes')

const app = express()

app.use(cors())
app.use(express.json({limit: '50mb'}));

app.use(morgan('dev'))
app.use(express.json())

app.use(taskRoutes)

app.listen(5000)