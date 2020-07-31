$(document).ready(function(){
	function getLocation(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
      alert("perangkat anda tidak mendukung untuk menangkap lokasi anda");
    }
  }

  function showPosition(position) {
      $("form").find(".panel-body").append("<label>LOKASI</label><br>Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude+"<input type='hidden' name='latitude' value='"+position.coords.latitude+"'><input type='hidden' name='longitude' value='"+position.coords.longitude+"'>");
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
  });