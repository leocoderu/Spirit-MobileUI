import 'package:auth_test/services/local_auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face ID example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final authenticate = await LocalAuth.authenticate();
                  setState(() {
                    authenticated = authenticate;
                  });
                },
                child: const Text('Authenticate'),
            ),
            if (authenticated)
              const Text('You are authenticated'),
            if (authenticated)
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      authenticated = false;
                    });
                  },
                  child: const Text('Log off'),
              )
          ],
        ),
      ),
    );
  }
}
