<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
    <!-- <meta http-equiv="refresh" content="2"> -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Vehicle Information</title>
    <style>
      #map {
        margin: auto;
        width: 70%;
        height: 700px;
      }
    </style>
  </head>

  <body>
    <h1>Vehicle Info for ${model.vehicle.name}</h1>

    <p>The last report for this vehicle was at ${model.position.timestamp}</p>

    <p>It was at lat long ${model.position.lat}, ${model.position.longitude}</p>

    <div id="map"></div>
    <script>
      function initMap() {
        var myLatLng = { lat: ${ model.position.lat }, lng: ${ model.position.longitude }
      };

      var mapDiv = document.getElementById('map');
      var map = new google.maps.Map(mapDiv, {
        center: myLatLng,
        zoom: 17
      });

      var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: '${model.position.timestamp}'
      });               
      }


    </script>
    <!-- Simply put: delaying script execution until the HTML parser has finished. -->
    <!-- add your key   -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=XXXX&callback=initMap">
    </script>
  </body>

  </html>