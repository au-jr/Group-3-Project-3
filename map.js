// Initialize map
var myMap = L.map('map').setView([20, 0], 2); 

//Add layer
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(myMap);

//Define a variable to store geojson reference
var geojsonLayer; 

// Function to load and display the GeoJSON data based on the selected year
function makeGeoJSON(year) {
    // Construct the URL
    var url = `../data/geo_data/simplified_geo_data_${year}.geojson`;
    d3.json(url).then(function(data) {
        // If there is an existing geojsonLayer, remove
        if (geojsonLayer) {
            myMap.removeLayer(geojsonLayer);
        }

        // Create a new choropleth layer
        geojsonLayer = L.choropleth(data, {
            valueProperty: "CO2 emissions per capita",
            scale: ['#ffffb2', '#fecc5c', '#fd8d3c', '#f03b20', '#bd0026'], 
            steps: 10,
            mode: "q",
            
            style: {
                color: '#ffffff',
                weight: 1,
                fillOpacity: 0.8
            },
            // Make popup to show per co2 emission, total co2 emission, population, GDP
            onEachFeature: function(feature, layer) {
                var popupContent = '<div style ="font-family: Arial, sans-serif;">' +
                    '<h2 style="color: black; font-weight: bold;">Country: ' + feature.properties.country + '</h2>' +
                    '<hr>' +
                    '<p><strong>CO₂ emissions per capita Consumption based:</strong> <span style="color: #FFA500;">' +
                    feature.properties["CO2 emissions per capita"] + ' t</span></p>' +
                    '<p><strong>Total Consumption CO₂ emissions:</strong> <span style="color: #FFA500;">' +
                    feature.properties["CO2 total emission"] + ' Mt</span></p>' +
                    '<p><strong>Population:</strong> <span style="color: #FFA500;">' +
                    feature.properties["population"] + ' </span></p>' +
                    '<p><strong>GDP:</strong><span style="color: #FFA500;">' +
                    feature.properties["GDP"] + ' </span></p>' +
                    '</div>';
                layer.bindPopup(popupContent);
            }
        }).addTo(myMap);
    });
}

// Listen for changes in the dropdown and load the appropriate geojson data
document.getElementById('yearSelector').addEventListener('change', function() {
    makeGeoJSON(this.value);
});

// Initially load the map for the first available year
makeGeoJSON('2019');

let limits = [0, 4, 8, 12, 16,20];
let colors = ['#ffffb2', '#fecc5c', '#fd8d3c', '#f03b20', '#bd0026'];
// Add legend to the map
let legend = L.control({position: "bottomright"});
legend.onAdd = function() {
    // Create new div as a container
    let div = L.DomUtil.create('div', 'info legend'),
    labels = [];
    //Html content for setting header of the legend, include minmum and max
    let legendInfo = "<h1>CO2 Emissions per Capita</h1>" +
        "<div class=\"labels\">" +
            "<div class=\"min\">" + limits[0] + "t</div>" +
            "<div class=\"max\">" + limits[limits.length - 1] + "t</div>" +
        "</div>";
    div.innerHTML = legendInfo;

    // Iterates through each limit value in the 'limits' array to create individual labels for legend
    limits.forEach(function(limit, index) {
        labels.push("<li style=\"background-color: " + colors[index] + "\">" +
                    (limits[index + 1] ? limit + "&ndash;" + limits[index + 1] + " t" : limit + "+ t") + "</li>");
    });

    //Append all
    div.innerHTML += "<ul>" + labels.join('') + "</ul>";
    return div;
};
// Adding the legend to the map
legend.addTo(myMap);