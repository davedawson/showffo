// Generated by CoffeeScript 1.3.3
(function() {
  var _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  (_base = FitgemClient.Views).Resources || (_base.Resources = {});

  FitgemClient.Views.Resources.ShowBodyMeasurementsView = (function(_super) {

    __extends(ShowBodyMeasurementsView, _super);

    function ShowBodyMeasurementsView() {
      return ShowBodyMeasurementsView.__super__.constructor.apply(this, arguments);
    }

    ShowBodyMeasurementsView.prototype.template = JST['templates/resources/body_measurements/show'];

    ShowBodyMeasurementsView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    };

    return ShowBodyMeasurementsView;

  })(Backbone.View);

}).call(this);
