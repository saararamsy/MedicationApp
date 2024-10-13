import 'package:flutter/material.dart';
import 'medication.dart';
import 'medication_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MedicationManager medicationManager = MedicationManager();
  List<Medication> filteredMedications = [];
  TextEditingController searchController = TextEditingController();

  // Constructor to add some sample medications when the HomeScreen is initialized
  _HomeScreenState() {
    // Adding predefined medications to the MedicationManager
    medicationManager.addMedication(
        Medication(id: 1, name: 'Aspirin', time: '08:00 AM', dose: 100));
    medicationManager.addMedication(
        Medication(id: 2, name: 'Ibuprofen', time: '12:00 PM', dose: 200));
    medicationManager.addMedication(
        Medication(id: 3, name: 'Paracetamol', time: '04:00 PM', dose: 500));
    medicationManager.addMedication(
        Medication(id: 4, name: 'Amoxicillin', time: '09:00 AM', dose: 250));
    medicationManager.addMedication(
        Medication(id: 5, name: 'Metformin', time: '07:00 AM', dose: 850));
    medicationManager.addMedication(
        Medication(id: 6, name: 'Atorvastatin', time: '10:00 AM', dose: 40));
    medicationManager.addMedication(
        Medication(id: 7, name: 'Albuterol', time: '01:00 PM', dose: 90));
    medicationManager.addMedication(
        Medication(id: 8, name: 'Lisinopril', time: '06:00 PM', dose: 10));
    medicationManager.addMedication(
        Medication(id: 9, name: 'Omeprazole', time: '08:30 AM', dose: 20));
    medicationManager.addMedication(Medication(
        id: 10, name: 'Hydrochlorothiazide', time: '05:00 PM', dose: 25));

    // Initially, all medications are shown when the HomeScreen is first loaded
    filteredMedications =
        medicationManager.getAllMedications(); // Initially show all medications
  }

  // Function to filter medications based on the search query
  void _filterMedications(String query) {
    final medications = medicationManager.getAllMedications();

    // If the search query is empty, show all medications
    if (query.isEmpty) {
      setState(() {
        filteredMedications = medications;
      });
    } else {
      // Filter the list of medications by matching the query (case-insensitive)
      setState(() {
        filteredMedications = medications
            .where(
                (med) => med.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the login screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar with rounded corners to make it visually appealing
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search', // Label for the search bar
                prefixIcon: const Icon(Icons.search), // Search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              // Calls the filter function whenever the search query changes
              onChanged: (query) => _filterMedications(query),
            ),
            const SizedBox(
                height: 16.0), // Space between the search bar and list

            // Expanded widget ensures that the ListView takes all remaining space
            Expanded(
              child: ListView.builder(
                // Number of medications to display
                itemCount: filteredMedications.length,
                // Builds each medication card in the list
                itemBuilder: (context, index) {
                  final medication = filteredMedications[index];
                  return Card(
                    elevation: 4, // Creates a shadow effect around the card
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Rounded corners for cards
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      // Display medication name in bold
                      title: Text(
                        medication.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      // Display medication time and dose
                      subtitle: Text(
                        'Time: ${medication.time}, Dose: ${medication.dose} mg',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
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
