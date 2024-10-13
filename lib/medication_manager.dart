import 'medication.dart'; // Import the Medication class

class MedicationManager {
  // Private list of medications to store all the medications added
  List<Medication> _medications = [];

  // Add a new medication to the list
  void addMedication(Medication medication) {
    _medications.add(medication); // Adds the medication to the internal list
    print(
        '${medication.name} added successfully!'); // Print confirmation for debugging
  }

  // Remove a medication by its ID
  void removeMedication(int id) {
    _medications.removeWhere(
        (med) => med.id == id); // Removes medication with matching ID
    print(
        'Medication with ID $id removed.'); // Print confirmation for debugging
  }

  // Update medication details based on ID
  void updateMedication(int id, String name, String time, double dose) {
    // Iterate over all medications to find the one with matching ID
    for (var med in _medications) {
      if (med.id == id) {
        // If found, update the medication details
        med.name = name;
        med.time = time;
        med.dose = dose;
        print(
            'Medication updated successfully!'); // Print success message for debugging
        return; // Exit the function once the medication is updated
      }
    }
    // If medication with the given ID is not found
    print('Medication with ID $id not found.');
  }

  // Get a list of all medications
  List<Medication> getAllMedications() {
    return _medications; // Return the list of medications
  }
}
