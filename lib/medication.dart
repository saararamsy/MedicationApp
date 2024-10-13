class Medication {
  // 'id' is a unique identifier for each medication and is immutable (final)
  final int id;

  // 'name' represents the name of the medication (can be changed)
  String name;

  // 'time' indicates when the medication should be taken (can be changed)
  String time;

  // 'dose' represents the dosage of the medication in milligrams (can be changed)
  double dose;

  // Constructor to initialize a Medication object. 'id', 'name', 'time', and 'dose' are required.
  Medication({
    required this.id, // The 'id' is required and cannot be changed once set
    required this.name, // The 'name' of the medication is required
    required this.time, // The 'time' the medication is taken is required
    required this.dose, // The 'dose' in milligrams is required
  });

  // Override the default toString method to provide a custom string representation of the Medication object
  @override
  String toString() {
    // Return a formatted string with medication details
    return 'Medication: $name, Time: $time, Dose: $dose mg';
  }
}
