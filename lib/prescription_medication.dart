import 'medication.dart'; // Importing the Medication class

// PrescriptionMedication class inherits from Medication class
class PrescriptionMedication extends Medication {
  // 'prescriptionNumber' is a unique identifier for the prescription and is immutable (final)
  final String prescriptionNumber;

  // Constructor to initialize a PrescriptionMedication object.
  // It uses the 'super' keyword to pass values to the parent Medication class
  PrescriptionMedication({
    required int id, // Medication's unique identifier
    required String name, // Name of the medication
    required String time, // Time to take the medication
    required double dose, // Dosage in milligrams
    required this.prescriptionNumber, // Prescription number specific to the medication
  }) : super(
            id: id,
            name: name,
            time: time,
            dose: dose); // Call the Medication constructor

  // Override the toString method to provide a custom string representation
  // This includes the prescription number along with medication details
  @override
  String toString() {
    // Return a formatted string with prescription medication details
    return 'Prescription Medication: $name, Prescription: $prescriptionNumber, Time: $time, Dose: $dose mg';
  }
}
