<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>My location</title>
<meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
<script src="https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js"></script>
<link href="https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.css" rel="stylesheet" />
<style>
	body { margin: 0; padding: 0; }
	#map { position: absolute; top: 0; bottom: 0; width: 100%; }
</style>
</head>
<body>
<div id="map"></div>

<script>
    function getLocation(){
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else { 
        alert("perangkat anda tidak mendukung untuk menangkap lokasi anda");
      }
    }

    function showPosition(position) {
        // $("form").find(".panel-body").append("<label>LOKASI</label><br>Latitude: " + position.coords.latitude + 
     //  "<br>Longitude: " + position.coords.longitude+"<input type='hidden' name='koordinat' value='long:"+position.coords.longitude+",lat:"+position.coords.latitude+"'>");
      long = position.coords.longitude;
      lat = position.coords.latitude;
      mapboxgl.accessToken = 'pk.eyJ1IjoiaXdhbnNhZnIiLCJhIjoiY2tkOThubTY2MGp0cDJ0cWF3bWl5dzhkNiJ9.hl20SKyacvb1KANAcNsfKg';
      var map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v11',
          zoom: 18,
            center: [long, lat],
      });
      var marker = new mapboxgl.Marker()
        .setLngLat([long, lat])
        .addTo(map);
      var a = long;
      var b = a.toFixed(4);
      console.log(a);
      console.log(b);

      var a = lat;
      var b = a.toFixed(4);
      console.log(a);
      console.log(b);
    }
    getLocation();
</script>

</body>
</html>