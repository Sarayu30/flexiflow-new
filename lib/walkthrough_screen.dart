import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'auth_screen.dart';
import 'admin_dashboard.dart'; // Add this import

class WalkthroughScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const WalkthroughScreen({super.key, required this.toggleTheme});

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Admin credentials
  final String _adminUsername = 'admin';
  final String _adminPassword = 'admin123';

  final List<Map<String, String>> walkthroughItems = [
    {
      "title": "Log and Track Symptoms",
      "description": "Easily record daily symptoms to monitor your arthritis journey with detailed tracking and history.",
      "animation": "assets/animations/log_animation.json",
    },
    {
      "title": "Personalized Recommendations",
      "description": "Get smart suggestions tailored specifically to your condition, symptoms, and needs.",
      "animation": "assets/animations/recomm.json",
    },
    {
      "title": "RA, SpA, OA Friendly",
      "description": "Comprehensive support designed for people with Rheumatoid Arthritis, Spondyloarthritis, or Osteoarthritis.",
      "animation": "assets/animations/friendly_support.json",
    },
  ];

  // Show admin login dialog
  void _showAdminLoginDialog() {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Admin Login'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (usernameController.text == _adminUsername &&
                  passwordController.text == _adminPassword) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminDashboard(
                      toggleTheme: widget.toggleTheme,
                      onLogout: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid credentials'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walkthrough'),
        backgroundColor: Colors.deepPurple,
        actions: [
          // Admin button
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: _showAdminLoginDialog,
            tooltip: 'Admin Login',
          ),
          // Theme toggle button
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: walkthroughItems.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                final item = walkthroughItems[index];
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Lottie.asset(
                        item["animation"]!,
                        height: 420, // Increased from 300 to 420 (40% increase)
                        width: 420,  // Increased from 300 to 420 (40% increase)
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        item["title"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        item["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              walkthroughItems.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
                width: _currentIndex == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.deepPurple : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(toggleTheme: widget.toggleTheme),
                  ),
                );
              },
              child: Text(
                _currentIndex == walkthroughItems.length - 1 ? "Get Started" : "Skip",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}