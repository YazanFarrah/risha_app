import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:risha_app/features/account/data/models/countries_model.dart';
import 'package:risha_app/features/account/data/static_data/countries_list.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  List<Country> filteredCountries = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load the countries from the JSON file
  
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchText = searchController.text.trim().toLowerCase();
    setState(() {
      filteredCountries = countriesList.where((country) {
        String countryName = Get.locale?.languageCode == 'en'
            ? country.name.toLowerCase()
            : country.name_ar.toLowerCase();
        return countryName.contains(searchText);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  Future<List<Country>> loadCountries() async {
    // Load the JSON file from assets
    final String response =
        await rootBundle.loadString('assets/countries.json');

    // Decode the JSON data
    final List<dynamic> data = json.decode(response);

    // Convert the decoded JSON into a list of Country objects
    return data.map((json) => Country.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredCountries.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, index) {
                      final country = filteredCountries[index];
                      return ListTile(
                        leading:
                            Text(country.flag, style: const TextStyle(fontSize: 24)),
                        title: Text(
                          Get.locale?.languageCode == 'en'
                              ? country.name
                              : country.name_ar,
                        ),
                        subtitle: Text(country.dial_code),
                        onTap: () {
                          // Handle country selection here if needed
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
