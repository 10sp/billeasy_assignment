const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const {pool} = require('./config')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))
app.use(cors())

const getEmployee = (request, response) => {
  pool.query('SELECT * FROM employee', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const addEmployee = (request, response) => {
  const {name,designation} = request.body

  pool.query(
    'INSERT INTO employee (name,designation) VALUES ($1, $2)',
    [name, designation],
    (error) => {
      if (error) {
        throw error
      }
      response.status(201).json({status: 'success', message: 'employee added.'})
    },
  )
}

app
  .route('/employee')
  // GET endpoint
  .get(getEmployee)
  // POST endpoint
  .post(addEmployee)

// Start server
app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`)
})