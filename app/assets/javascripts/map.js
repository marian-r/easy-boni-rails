$(function () {
    var gmaps = google.maps;
    var mapElem = $('#map-canvas');
    var mapOptions = {
        center: new gmaps.LatLng(45.8, 16.0),
        zoom: 8,
        mapTypeId: gmaps.MapTypeId.ROADMAP
    };
    var map = new gmaps.Map(mapElem.get(0), mapOptions);
    var infoWindow = new gmaps.InfoWindow();


    $.get('/list.json').done(function (data) {

        data.forEach(function (restaurant) {

            var coordinates = restaurant.coordinates;
            var latLng = new gmaps.LatLng(coordinates[0], coordinates[1]);

            var marker = new gmaps.Marker({
                position: latLng,
                map: map,
                title: restaurant.name
            });

            gmaps.event.addListener(marker, 'click', function () {
                infoWindow.setContent(restaurant.name);
                infoWindow.setPosition(latLng);
                infoWindow.open(map, marker);
            });
        });

    });
});
