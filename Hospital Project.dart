import 'dart:io';

class HospitalManagementSystem {
  Map<String, String> users = {
    'admin': 'admin123',
    'user': 'user123',
  };
  List<Map<String, dynamic>> patients = [];
  List<Map<String, dynamic>> appointments = [];

  void login() {
    print('Welcome to City Hospital Management System!');
    stdout.write('Enter username: ');
    String? username = stdin.readLineSync();
    stdout.write('Enter password: ');
    String? password = stdin.readLineSync();

    if (users.containsKey(username) && users[username] == password) {
      print('Login successful!');
      mainMenu();
    } else {
      print('Invalid username or password. Please try again.');
      login();
    }
  }

  void addPatient() {
    print('Enter patient details:');
    stdout.write('Name: ');
    String name = stdin.readLineSync()!;
    stdout.write('Age: ');
    int age = int.parse(stdin.readLineSync()!);
    stdout.write('Gender: ');
    String gender = stdin.readLineSync()!;
    stdout.write('Condition: ');
    String condition = stdin.readLineSync()!;

    patients.add({
      'name': name,
      'age': age,
      'gender': gender,
      'condition': condition,
    });

    print('Patient added successfully!');
  }

  void listPatients() {
    if (patients.isEmpty) {
      print('No patients in the system.');
    } else {
      print('List of Patients:');
      for (var patient in patients) {
        print(
            'Name: ${patient['name']}, Age: ${patient['age']}, Gender: ${patient['gender']}, Condition: ${patient['condition']}');
      }
    }
  }

  void removePatient() {
    if (patients.isEmpty) {
      print('No patients in the system.');
    } else {
      listPatients();
      stdout.write('Enter the index of the patient to remove: ');
      int index = int.parse(stdin.readLineSync()!);
      if (index >= 0 && index < patients.length) {
        patients.removeAt(index);
        print('Patient removed successfully!');
      } else {
        print('Invalid index.');
      }
    }
  }

  void scheduleAppointment() {
    print('Enter appointment details:');
    stdout.write('Patient Index: ');
    int patientIndex = int.parse(stdin.readLineSync()!);

    if (patientIndex >= 0 && patientIndex < patients.length) {
      stdout.write('Date: ');
      String date = stdin.readLineSync()!;
      stdout.write('Time: ');
      String time = stdin.readLineSync()!;

      appointments.add({
        'patientIndex': patientIndex,
        'date': date,
        'time': time,
      });

      print('Appointment scheduled successfully!');
    } else {
      print('Invalid patient index.');
    }
  }

  void listAppointments() {
    if (appointments.isEmpty) {
      print('No appointments scheduled.');
    } else {
      print('List of Appointments:');
      for (var appointment in appointments) {
        int patientIndex = appointment['patientIndex'];
        var patient = patients[patientIndex];
        print(
            'Patient: ${patient['name']}, Date: ${appointment['date']}, Time: ${appointment['time']}');
      }
    }
  }

  void mainMenu() {
    print('\nMain Menu:');
    print('1. Add Patient');
    print('2. List Patients');
    print('3. Remove Patient');
    print('4. Schedule Appointment');
    print('5. List Appointments');
    print('6. Logout');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      addPatient();
      mainMenu();
    } else if (choice == '2') {
      listPatients();
      mainMenu();
    } else if (choice == '3') {
      removePatient();
      mainMenu();
    } else if (choice == '4') {
      scheduleAppointment();
      mainMenu();
    } else if (choice == '5') {
      listAppointments();
      mainMenu();
    } else if (choice == '6') {
      print('Logged out.');
      login();
    } else {
      print('Invalid choice. Please try again.');
      mainMenu();
    }
  }

  void start() {
    login();
  }
}

void main() {
  HospitalManagementSystem hospitalSystem = HospitalManagementSystem();
  hospitalSystem.start();
}
