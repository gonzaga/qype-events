var GoogleMap = GoogleMap || {}
GoogleMap.initialize = function(center, zoom) {
	var myOptions = {
    center: new google.maps.LatLng(center.lat, center.lng),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
	var map = new google.maps.Map(document.getElementById("map_canvas"),
      myOptions);
}
GoogleMap.add_marker = function(position, info) {
	var marker = new google.maps.Marker({
      position: new google.maps.LatLng(position.lat, position.lng),
      title: '<%= event.title %>'
  });
  var contentString = info;
  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });
  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });
  marker.setMap(map);
};