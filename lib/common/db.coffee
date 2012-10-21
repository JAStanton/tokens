mysql = require "mysql"
db = "`tokens`"

client = mysql.createClient
  user: "root"
  password: ""

console.log "Connected to db."

client.query "USE #{db}"

exports.query = (sql, params, cb) ->
  client.query(sql, params, cb)
