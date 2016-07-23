# Description:
#   Hello World!
#
# Commands:
#   hubot hello - Say "World!"

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    msg.reply "World!"
