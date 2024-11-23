class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
        required this.price,
        required this.category,
        required this.plantName,
        required this.size,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.imageURL,
        required this.isFavorated,
        required this.decription,
        required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 3860,
        category: 'Indoor',
        plantName: 'Coffee',
        size: 'Small to Medium',
        rating: 4.5,
        humidity: 60,
        temperature: '18-24',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: true,
        decription:
        'Coffee plants are typically grown indoors in cooler regions, and they thrive in high humidity and indirect sunlight. Known for their famous coffee beans, these plants have glossy leaves and white fragrant flowers. They can be decorative while also producing a small amount of coffee in a home setting.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Cotton',
        size: 'Medium',
        rating: 4.8,
        humidity: 60,
        temperature: '21 - 30',
        imageURL: 'assets/images/plant-two.png',
        isFavorated: false,
        decription:
        'Cotton thriving in the states black soil and semi-arid climate. making it a significant agricultural commodity.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Cucumber',
        size: 'Meduim',
        rating: 4.7,
        humidity: 60,
        temperature: '21 - 27',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        decription:
        'Smaller cucumber varieties like bush cucumbers are perfect for indoor growing. They thrive with good light and a trellis for support, yielding fresh cucumbers for salads and snacks',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 30,
        category: 'Indoor',
        plantName: 'Radishes',
        size: 'Small',
        rating: 4.7,
        humidity: 55,
        temperature: '16 - 24',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: false,
        decription:
        'Radishes are fast-growing root vegetables that thrive indoors. They require minimal care and can be harvested within a few weeks, making them an ideal choice for beginners.',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 24,
        category: 'Outdoor',
        plantName: 'Groundnut(Peanut)',
        size: 'Meduim',
        rating: 4.7,
        humidity: 55,
        temperature: '25 - 35',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: true,
        decription:
        'Groundnuts, or peanuts, are a crucial oilseed crop in India, thriving in well-drained sandy loam soils and warm climates of 25-35°C. They are rich in protein and oil, commonly consumed as snacks or used in various food products, significantly contributing to the agricultural economy',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Cumin(Jeera)',
        size: 'Medium',
        rating: 4.8,
        humidity: 40,
        temperature: '20 - 30',
        imageURL: 'assets/images/plant-five.png',
        isFavorated: false,
        decription:
        'Cumin (Jeera) is a spice grown in arid regions, thriving in well-drained sandy loam soils and warm temperatures between 20-30°C. Typically harvested after 100-120 days, cumin is widely used in cooking for its distinct flavor and has medicinal benefits, aiding digestion and offering antioxidant properties',
        isSelected: false),
    Plant(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Apple',
        size: 'Large',
        rating: 4.2,
        humidity: 50,
        temperature: '20 - 25',
        imageURL: 'assets/images/plant-six.png',
        isFavorated: false,
        decription:
        'Apples are widely cultivated fruits known for their crisp texture and sweet to tart flavor, grown on trees in temperate climates. They are rich in vitamins, antioxidants, and dietary fiber, offering various health benefits. Enjoyed fresh or in recipes, apples come in many varieties, including Fuji, Gala, and Granny Smith, and are typically harvested in late summer to fall.',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Orange',
        size: 'Medium',
        rating: 4.5,
        humidity: 60,
        temperature: '20 - 30',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
        'Oranges are citrus fruits valued for their juicy sweetness and high vitamin C content. They thrive in warm climates with well-drained soils and are typically harvested in winter and early spring. Rich in fiber and antioxidants, oranges are versatile for fresh consumption, juicing, or culinary uses, contributing to overall health.',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 46,
        category: 'Outdoor',
        plantName: 'Wheat',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-eight.png',
        isFavorated: false,
        decription:
        'Wheat is a staple crop grown in temperate regions, thriving in well-drained loamy soils with moderate rainfall. Typically sown during the Rabi season and harvested after 4-5 months, it provides a major source of carbohydrates and is used for making bread, pasta, and other food products',
        isSelected: false),
    Plant(
        plantId: 9,
        price: 110,
        category: 'Garden',
        plantName: 'Muskmelon',
        size: 'Large',
        rating: 4.6,
        humidity: 70,
        temperature: '22 - 30',
        imageURL: 'assets/images/plant-eight1.png',
        isFavorated: false,
        decription:
        'Muskmelon is another vine-growing plant that bears sweet, fragrant fruits. The plant thrives in warm weather and sandy loam soil, requiring regular watering but avoiding waterlogging.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants(){
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants(){
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}
