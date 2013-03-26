window.FitgemClient =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: (options) ->
    @router = new FitgemClient.Routers.ResourcesRouter(options)
    Backbone.history.start()