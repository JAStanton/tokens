exports.index = (req, res) ->
  res.render 'layouts/index',
    title: 'Home'

exports.users = (req, res) ->
  res.render 'layouts/user',
    title: 'Users'
