import 'package:contuct_list_getx/src/controllers/contactController.dart';
import 'package:contuct_list_getx/src/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddContact extends StatefulWidget {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? address;

  AddContact({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
  });

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final contactController = Get.put(CantactController(), permanent: true);

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.fullName!;
    phoneController.text = widget.phoneNumber!;
    emailController.text = widget.email!;
    addressController.text = widget.address!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Add Contact List',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Icon(
                Icons.person_pin,
                size: 120,
                color: Colors.teal,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${widget.phoneNumber}'),
              TextFormField(
                controller: nameController,
                onChanged: contactController.fullName,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Full Nmme',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: contactController.email,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                onChanged: contactController.phoneNumber,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 1.0,
                    ),
                  ),
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: addressController,
                onChanged: contactController.address,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.teal,
                      width: 1.0,
                    ),
                  ),
                  labelText: ' Address',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // SizedBox(
              //   width: Get.width,
              //   child: TextButton(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Colors.teal),
              //         foregroundColor: MaterialStateProperty.all(Colors.white),
              //         shape: MaterialStateProperty.all(
              //           StadiumBorder(),
              //         )),
              //     onPressed: () {
              //       contactController.addContuct();
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(Icons.add),
              //           SizedBox(
              //             width: 7,
              //           ),
              //           Text(
              //             'Add Contuct',
              //             style: TextStyle(
              //               fontSize: 16,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )

              SizedBox(
                width: Get.width,
                child: TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      widget.id != null ? Colors.redAccent : Colors.teal[400],
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {
                    widget.id != null
                        ? contactController.editContact(
                            id: widget.id.toString())
                        : contactController.addContuct();
                  },
                  icon: Icon(
                    widget.id != null ? Icons.upload_file : Icons.add,
                  ),
                  label: Text(widget.id != null ? 'Update' : 'Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
