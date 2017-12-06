// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var address = '';
var latitude = '';
var longitude = '';

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;
    $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?',
      { latlng: latitude+","+longitude},
      function(data) {
          var address_components = data.results[0].address_components;

          var sublocality = address_components.filter(function(x){ return x.types[1] === "sublocality" });
          var city = address_components.filter(function(x){ return x.types[0] === "administrative_area_level_2" });
          var state = address_components.filter(function(x){ return x.types[0] === "administrative_area_level_1" });
          var country = address_components.filter(function(x){ return x.types[0] === "country" });

          address = sublocality[0].short_name + ", " + city[0].short_name + ", " + state[0].long_name + " - " + country[0].short_name;

          $("ul#location").removeClass('hide');
          $("#user_address").append(address);

      });
  });
}

$(document).ready(function(){
  
  $('#my-location').click(function(){
    $('#tree_address').val(address);
    $('#tree_latitude').val(latitude);
    $('#tree_longitude').val(longitude);
    $('#local_address').val(address);
    $('#local_latitude').val(latitude);
    $('#local_longitude').val(longitude);
  });
});