import 'package:get/get.dart';
import 'package:tele_health/models/doctor_profile.dart';
import 'package:tele_health/models/patient_profile.dart';

enum AccountType { doctor, patient }

class ProfileController extends GetxController {
  var doctorProfile = DoctorProfile().obs;
  var patientProfile = PatientProfile().obs;

  AccountType? accountType;
}
