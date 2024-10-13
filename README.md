

# Medication App

A simple Flutter app to demonstrate a medication management system, including a login page and a home screen that displays medications. This project showcases the use of good design principles, navigation, form validation, and OOP concepts.

---

## Design Choices

1. **Login Screen with Form Validation**  
   - **Reason**: Ensures that users provide valid input (e.g., proper email format and a secure password).
   - **UI Design**: The login page includes a title ("Medication App") and a "Login" heading to make it clear what the page is for.
   - **Feedback Mechanism**: Used `SnackBar` to provide real-time feedback for a successful login, which keeps users informed.

2. **Home Screen with Search Functionality**  
   - **Reason**: Users can quickly search for medications by name using the search bar. This improves usability when dealing with long medication lists.
   - **UI Design**: Medications are displayed in **cards** to create a neat, readable layout, with rounded corners for a modern look.
   - **Navigation**: A **back button** is provided on the home screen to allow users to navigate back to the login screen, enhancing user flow.

3. **Object-Oriented Programming Concepts**  
   - **Encapsulation**: `MedicationManager` handles all operations on medications (add, update, delete) to keep the UI code clean and organized.
   - **Inheritance**: The `PrescriptionMedication` class extends the `Medication` class to reuse code while adding prescription-specific properties.
   - **Polymorphism**: Overridden `toString()` methods provide clear medication details for easy debugging and logging.

---

## Assumptions

1. **User Authentication**  
   - Assumes a **basic login system** without real authentication. The goal is to demonstrate form validation and navigation, not secure authentication.

2. **Medication List**  
   - The medications are **hardcoded** into the app for simplicity. No backend or persistent storage is used to save or load medications across sessions.

3. **Limited Scope**  
   - Focuses only on core features required for the **intern test**: login, medication management, and navigation. Advanced features like adding/deleting medications via the UI are out of scope.

4. **Platform**  
   - Assumes the app will primarily run on **Chrome (web)**, based on the test requirements. No additional setup for Android or iOS was included.

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/saararamsy/MedicationApp
   ```
2. Navigate to the project folder:
   ```bash
   cd medication_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run -d chrome
   ```

