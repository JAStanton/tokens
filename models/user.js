// Generated by CoffeeScript 1.3.3
(function() {
  var db;

  db = require('../common/db.js');

  exports["new"] = function(req, res) {
    var data;
    data = req.body;
    return db.query('INSERT INTO users SET username = ?, password = ?', [data.username, data.password], function(err, results, fields) {
      var insertId;
      insertId = results.insertId;
      data.id = insertId;
      return res.send(JSON.stringify(data));
    });
  };

  exports.list = function(req, res) {
    return db.query('SELECT id, username FROM users', function(err, results, fields) {
      if (results !== void 0) {
        return res.send(JSON.stringify(results));
      } else {
        return res.send('404');
      }
    });
  };

  exports.get = function(req, res) {
    var id;
    id = req.params.id;
    return db.query('SELECT id, username FROM users WHERE id = ?', [id], function(err, results, fields) {
      if (results !== void 0) {
        return res.send(JSON.stringify(results[0]));
      } else {
        return res.send('404');
      }
    });
  };

}).call(this);