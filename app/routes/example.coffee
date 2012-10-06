# we export a function that takes the app as an only parameter. Though we can
# take as many params (`db` for example) as we like.
#
module.exports = (app) ->
    
    # with app, we declare our routes and the handlers
    app.get '/', (req, res) ->
        res.render 'example'
