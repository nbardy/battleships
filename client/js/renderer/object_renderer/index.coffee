lookup = (object) ->
  if object.type == 'ship'
    return require('./ship')(object)
  else if object.type == 'projectile'
    return require('./projectile')(object)
  else
    return []

module.exports = lookup
