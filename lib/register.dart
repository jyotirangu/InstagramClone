import 'package:flutter/material.dart';
import 'package:radhe_radhe/Navigate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoForm extends StatefulWidget {
  @override
  _UserInfoFormState createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('bio', _bioController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setBool('login', true);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Data Saved!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Navigate()));
  }

  void check() async {
    final prefs = await SharedPreferences.getInstance();
    bool? check = prefs.getBool('login') ?? false;

    if (check) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Navigate()));
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Information'),
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assest/img/RadheRadhe.png",
                    width: 200,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(
                    controller: _nameController,
                    label: 'Name',
                    validator: _validateName),
                SizedBox(height: 16),
                _buildTextField(controller: _bioController, label: 'Bio'),
                SizedBox(height: 16),
                _buildTextField(
                    controller: _phoneController,
                    label: 'Phone Number',
                    keyboardType: TextInputType.phone,
                    validator: _validatePhone),
                SizedBox(height: 16),
                _buildTextField(
                    controller: _emailController,
                    label: 'Email ID',
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _saveData();
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.grey[300])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Submit',
                        style: TextStyle(fontSize: 18, color: Colors.teal)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Set the background color
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: Colors.black), // Text color
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal), // Label color
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email ID';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email ID';
    }
    return null;
  }
}
