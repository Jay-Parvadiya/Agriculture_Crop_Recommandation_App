import 'package:flutter/material.dart';
import 'package:flut/constants.dart';
import 'package:flut/ui/screens/signin_page.dart'; // Import the SignIn page
import 'package:flut/ui/screens/widgets/profile_widget.dart';
import 'package:flut/ui/screens/settings_page.dart'; // Import your SettingsPage
import 'package:flut/ui/screens/notifications_page.dart'; // Import your NotificationsPage
import 'package:flut/ui/screens/faqs_page.dart'; // Import your FAQsPage
import 'package:flut/ui/screens/share_page.dart'; // Import your SharePage
import 'package:flut/ui/screens/community_page.dart'; // Import your CommunityPage
import 'package:flut/ui/screens/articles_page.dart'; // Import your ArticlesPage

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Example to check if the user is signed in or not
    bool isUserSignedIn = false; // Change this based on your authentication logic

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display profile avatar only if signed in
              if (isUserSignedIn) ...[
                Container(
                  width: 150,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                          height: 24,
                          child: Image.asset("assets/images/verified.png")),
                    ],
                  ),
                ),
                Text(
                  'johndoe@gmail.com',
                  style: TextStyle(
                    color: Constants.blackColor.withOpacity(.3),
                  ),
                ),
                const SizedBox(height: 30),
              ] else ...[
                // If not signed in, show sign-in prompt
                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Your account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Join Community',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Constants.primaryColor, // Add background color
                        side: BorderSide(
                          color: Constants.primaryColor,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white, // Set the text color to white
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
              SizedBox(
                height: size.height * .5,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationsPage()),
                        );
                      },
                    ),
                    // Add the Community section
                    ProfileWidget(
                      icon: Icons.group,
                      title: 'Community',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CommunityPage()),
                        );
                      },
                    ),
                    // Add the Articles/News section
                    ProfileWidget(
                      icon: Icons.article,
                      title: 'Articles/News',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArticlesPage()),
                        );
                      },
                    ),
                    // Move Share section to the bottom
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SharePage()),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FAQsPage()),
                        );
                      },
                    ),
                    // Only show the Log Out button if the user is signed in
                    if (isUserSignedIn)
                      ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                        onTap: () {
                          // Handle log out logic here
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
