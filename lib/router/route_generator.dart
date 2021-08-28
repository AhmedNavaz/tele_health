// STATIC ROUTES NAME
import 'package:flutter/material.dart';
import 'package:tele_health/screens/authentication/body.dart';
import 'package:tele_health/screens/authentication/define_user_screen.dart';
import 'package:tele_health/screens/verification/academic_screen.dart';
import 'package:tele_health/screens/verification/certification_screen.dart';
import 'package:tele_health/screens/verification/id_screen.dart';
import 'package:tele_health/screens/verification/verification_screen.dart';

const String initialRoute = '/';
const String authBody = '/auth-body';
const String verification = '/verification';
const String nationalId = '/national-id';
const String academicDocs = '/academic-docs';
const String certifications = '/certifications';

// ignore: todo
// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(DefineUserScreen());

      case authBody:
        return _getPageRoute(AuthBody());

      case verification:
        return _getPageRoute(VerificationScreen());

      case nationalId:
        return _getPageRoute(IDScreen());

      case academicDocs:
        return _getPageRoute(AcademicScreen());

      case certifications:
        return _getPageRoute(CertificationScreen());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}

class IdScreen {}
