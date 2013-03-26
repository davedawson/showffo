class FitgemClient.Routers.ResourcesRouter extends Backbone.Router
  routes:
    "/" : "show"

  initialize: (options) ->
    Backbone.emulateHTTP = true
    @user = new FitgemClient.Models.User(options)
    @body_measurements = new FitgemClient.Models.BodyMeasurements()

  show: ->
    console.log('test')
    if @user.get("linked")
      if $('#fitbit-user-data')
        console.log('test');
        @user.fetch
          success: =>
            user_view = new FitgemClient.Views.Resources.ShowUserView(model: @user)
            $('#fitbit-user-data').html(user_view.render().el)
          error: =>
            view = new FitgemClient.Views.Common.ConnectionErrorView()
            $(".fitbit-data-view").html(view.render().el)

      if $('#fitbit-body-measurements-data')
        console.log('123test');
        @body_measurements.fetch
          success: =>
            user_view = new FitgemClient.Views.Resources.ShowBodyMeasurementsView(model: @body_measurements)
            $('#fitbit-body-measurements-data').html(user_view.render().el)
          error: =>
            view = new FitgemClient.Views.Common.ConnectionErrorView()
            $(".fitbit-data-view").html(view.render().el)

    else if @user.get("logged_in")
      view = new FitgemClient.Views.Common.AccountsNotLinkedView()
      $(".fitbit-data-view").html(view.render().el)
      console.log('test');
    else
      view = new FitgemClient.Views.Common.NotLoggedInView()
      $(".fitbit-data-view").html(view.render().el)
      console.log('test');

