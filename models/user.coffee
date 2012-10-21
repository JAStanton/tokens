require("coffee-script")
db = require '../common/db'

exports.new = (req, res) ->
  data = req.body
  db.query 'INSERT INTO users SET username = ?, password = ?',
    [data.username, data.password],
    (err, results, fields) ->
      insertId = results.insertId
      data.id = insertId
      res.send JSON.stringify data


exports.list = (req, res) ->
  db.query 'SELECT id, username FROM users',
    (err, results, fields) ->
      if results != undefined
        res.send JSON.stringify results
      else
        res.send '404'

exports.get = (req, res) ->
  id = req.params.id
  db.query 'SELECT id, username FROM users WHERE id = ?',
    [id], (err, results, fields) ->
      if results != undefined
        res.send JSON.stringify results[0]
      else
        res.send '404'
