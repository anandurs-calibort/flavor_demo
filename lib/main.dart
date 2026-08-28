import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/app_config.dart';


void main() {
  switch (appFlavor) {
    case 'dev':
      AppConfig.initialize(
        flavor: Flavor.development,
        appName: 'Flavor Demo Dev',
        apiBaseUrl: 'https://dev-api.example.com',
      );
      break;

    case 'staging':
      AppConfig.initialize(
        flavor: Flavor.staging,
        appName: 'Flavor Demo Staging',
        apiBaseUrl: 'https://staging-api.example.com',
      );
      break;

    case 'prod':
      AppConfig.initialize(
        flavor: Flavor.production,
        appName: 'Flavor Demo',
        apiBaseUrl: 'https://api.example.com',
      );
      break;

    default:
      AppConfig.initialize(
        flavor: Flavor.development,
        appName: 'Flavor Demo Dev',
        apiBaseUrl: 'https://dev-api.example.com',
      );
  }

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: config.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(config.appName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flavor: ${config.flavor.name}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Text('API: ${config.apiBaseUrl}'),
            ],
          ),
        ),
      ),
    );
  }
}