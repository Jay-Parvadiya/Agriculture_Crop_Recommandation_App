import 'package:flutter/material.dart';
import 'package:flut/constants.dart';
import 'package:flut/models/plants.dart';
import 'package:flut/ui/screens/detail_page.dart';
import 'package:flut/ui/screens/widgets/plant_widget.dart';
import 'package:flut/ui/screens/weather_service.dart'; // Import WeatherService
// import 'package:geolocator/geolocator.dart'; // Import Geolocator
import 'package:page_transition/page_transition.dart';
// import 'community_page.dart'; // Import Community Page
// import 'articles_page.dart'; // Import Articles Page

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // To keep track of selected index
  List<Plant> _plantList = Plant.plantList; // All plants
  List<Plant> _filteredPlants = []; // Plants based on selected category
  String location = ''; // Variable to hold location name
  String temperature = ''; // Variable to hold temperature

  // Plants category
  List<String> _plantTypes = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
  ];

  @override
  void initState() {
    super.initState();
    _filteredPlants = _plantList; // Initially show all plants
    // _getCurrentLocation(); // Fetch the current location on init
    // _fetchAhmedabadTemperature(); // Fetch temperature for Ahmedabad
  }
  Future<void> _fetchAhmedabadTemperature() async {
    WeatherService weatherService = WeatherService();
    try {
      double? temperature = await weatherService.fetchAhmedabadTemperature();
      setState(() {
        // Update your UI with the temperature, e.g., save it in a variable
        if (temperature != null) {
          // Display or use the temperature value
          print('Temperature in Ahmedabad: $temperature°C'); // Just an example
        }
      });
    } catch (e) {
      print('Error fetching temperature: $e');
    }
  }
  // Future<void> _getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled, you might want to show a message to the user.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, you might want to show a message to the user.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, you might want to show a message to the user.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can access the position.
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   _fetchWeather(position.latitude, position.longitude); // Fetch weather data with user's location
  // }
  //
  // Future<void> _fetchWeather(double latitude, double longitude) async {
  //   WeatherService weatherService = WeatherService();
  //   try {
  //     final weatherData = await weatherService.fetchWeather(latitude, longitude); // Fetch weather data using latitude and longitude
  //     setState(() {
  //       location = weatherData['name']; // Extract location name
  //       temperature = (weatherData['main']['temp'] - 273.15).toStringAsFixed(1); // Convert Kelvin to Celsius
  //     });
  //   } catch (e) {
  //     print('Error fetching weather data: $e');
  //   }
  // }

  // Filter plants based on selected category
  void _filterPlants(int index) {
    setState(() {
      selectedIndex = index;

      if (index == 0) {
        _filteredPlants = _plantList; // Show all plants for 'Recommended'
      } else {
        String selectedType = _plantTypes[index];
        _filteredPlants = _plantList.where((plant) => plant.category == selectedType).toList();
      }
    });
  }

  // Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather Information
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.isNotEmpty ? location : 'Loading...',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    temperature.isNotEmpty ? '$temperature °C' : 'Fetching temperature...',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            // Search Bar
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search Plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            // Plant Types
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        _filterPlants(index); // Filter plants based on selected type
                      },
                      child: Text(
                        _plantTypes[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Featured Plants
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: _filteredPlants.length, // Use filtered plants
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(
                            plantId: _filteredPlants[index].plantId,
                          ),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorated(
                                      _filteredPlants[index].isFavorated,
                                    );
                                    _filteredPlants[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(
                                  _filteredPlants[index].isFavorated == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Constants.primaryColor,
                                ),
                                iconSize: 30,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            right: 50,
                            top: 50,
                            bottom: 50,
                            child: Image.asset(_filteredPlants[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _filteredPlants[index].category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  _filteredPlants[index].plantName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                r'₹' + _filteredPlants[index].price.toString(),
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ),
            // New Plants Section
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'New Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: _filteredPlants.length, // Use filtered plants
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(plantId: _filteredPlants[index].plantId),
                          type: PageTransitionType.bottomToTop,
                        ),
                      );
                    },
                    child: PlantWidget(index: index, plantList: _filteredPlants), // Use filtered plants
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
