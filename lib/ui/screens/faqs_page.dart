import 'package:flutter/material.dart';
import 'package:flut/constants.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQs',
          style: TextStyle(color: Colors.white), // Changed color of 'FAQs' to white
        ),
        backgroundColor: Constants.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const SizedBox(height: 20), // Add some spacing

          // Plant Care Section
          Text(
            'Plant Care',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Constants.blackColor,
            ),
          ),
          ExpansionTile(
            title: Text(
              'How can I care for my plants?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'To take care of your plants, ensure they get enough sunlight, water them regularly, and use appropriate soil.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'How do I know if my plant needs more sunlight?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'If your plant has pale leaves or slow growth, it might need more sunlight. Move it to a brighter spot for better growth.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'What type of soil is best for houseplants?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Houseplants generally thrive in potting mix. Make sure it’s well-draining and suitable for the type of plant.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Plant Purchases Section
          Text(
            'Plant Purchases',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Constants.blackColor,
            ),
          ),
          ExpansionTile(
            title: Text(
              'What types of plants can I buy?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You can purchase a wide variety of plants, from indoor to outdoor, succulents, flowers, and much more.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Can I get plant recommendations?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Yes, our app provides personalized plant recommendations based on your preferences and space requirements.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'How long does it take for delivery?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Delivery times depend on your location. Typically, plants are delivered within 3-5 business days.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Community Section
          Text(
            'Community',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Constants.blackColor,
            ),
          ),
          ExpansionTile(
            title: Text(
              'How can I join the PlantX community?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You can join by signing up through the app. Go to the profile section, and click on "Sign In" to get started.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Can I share my plant care tips?',
              style: TextStyle(color: Constants.blackColor, fontSize: 18),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Yes, we encourage users to share their plant care tips within the community section of the app.',
                  style: TextStyle(color: Constants.blackColor.withOpacity(0.7)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
