import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';
import 'package:tele_health/models/doctor_profile.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  _CertificationScreenState createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileController profileController = Get.find<ProfileController>();
  String? _fileName;
  PlatformFile? _path;
  bool _loadingPath = false;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _path = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['pdf', 'doc', 'docx'],
      ))
          ?.files
          .single;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;

    setState(() {
      _loadingPath = false;

      _fileName = _path != null ? p.basename(_path!.path.toString()) : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          "Upload Certifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Please add your documets for verification, so that you can start working on TeleHealth',
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () => _openFileExplorer(),
                  child: const Text("Upload File"),
                ),
              ),
              Text(
                'Supported files: .pdf, .doc, .docx',
                style: TextStyle(color: Colors.red.shade300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Academic Documents',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator(),
                        )
                      : _path != null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade500),
                              ),
                              child: ListTile(
                                  title: Text(
                                    '$_fileName',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: p.extension(_path!.path!) == '.pdf'
                                      ? Image.asset(
                                          'assets/images/pdf_file.png',
                                          width: 40,
                                          height: 40,
                                        )
                                      : Image.asset(
                                          'assets/images/word_file.png',
                                          width: 40,
                                          height: 40,
                                        )),
                            )
                          : const Text('No file uploaded yet'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {
                  profileController.doctorProfile.value.certifications = true;
                  navigationController.goBack();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
