import 'package:cybersafe/pages/levels/intro_level/intro_level_3.dart';
import 'package:flutter/material.dart';

class IntroLevel2 extends StatelessWidget {
  const IntroLevel2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                'lib/images/surokkha logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Registration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader('Fill in the form'),
              const SizedBox(height: 20),
              _buildFormTextBox('NID', 'Enter your National ID Number',
                  textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Date of Birth', 'According to NID',
                  textColor: Colors.black),
              const SizedBox(height: 20),
              _buildSectionHeader('Details'),
              const SizedBox(height: 20),
              _buildFormTextBox('Name', 'Enter Full name',
                  textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Mobile no', 'Current Number',
                  textColor: Colors.black),
              const SizedBox(height: 10),
              _buildFormTextBox('Address', 'Present Address',
                  textColor: Colors.black),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroLevel3()),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child:
                    const Text('Apply', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormTextBox(String labelText, String hintText,
      {Color textColor = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        if (labelText == 'Address')
          TextFormField(
            style: TextStyle(color: textColor),
            maxLines: 3,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange[100]!, width: 2.0),
              ),
            ),
          ),
        //* Bigger text box for address
        if (labelText !=
            'Address')
          TextFormField(
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange[100]!, width: 2.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 30,
            color: Colors.orange,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
