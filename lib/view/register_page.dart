import 'package:flutter/material.dart';
import 'package:pet_care/model/registration_model.dart';
import 'package:pet_care/resource/constants/constant_values.dart';
import 'package:pet_care/resource/constants/sized_box.dart';
import 'package:pet_care/resource/constants/style.dart';
import 'package:validators/validators.dart';
import '../Controller/authentication_base.dart';
import '../Controller/authentication_functions.dart';
import '../resource/components/buttons.dart';
import '../resource/constants/colors.dart';
import '../utilities/InfoDisplay/message.dart';
import '../utilities/routes/routes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final ValueNotifier<bool> _obsecureText = ValueNotifier(true);

  // text controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();

  // focusing pointer
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _petNameFocusNode = FocusNode();

  // initial age for registration
  double _initialAge = 1;
  // check box default value
  bool _checkBoxValue = false;

  // drop down menu selected value
  String petType = MyConstants().petType.first;
  String dogBreed = MyConstants().dogBreeds.first;
  String catBreed = MyConstants().catBreeds.first;
  // pet gender
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: AppColors().appBar_theme,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // name form field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _nameFocusNode,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Pet Owner Name",
                    ),
                    prefixIcon: Icon(Icons.face_rounded),
                  ),
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_petNameFocusNode),
                ),
              ),

              // email textform field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email_rounded),
                  ),
                  // requesting for password field focus
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
              ),

              // listining for obsecure icon tap
              ValueListenableBuilder(
                  valueListenable: _obsecureText,
                  builder: (context, obsecureText, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        obscureText: _obsecureText.value,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text("Password"),
                            prefixIcon: const Icon(
                              Icons.lock_rounded,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  // inverting obsecure password ontap
                                  _obsecureText.value = !_obsecureText.value;
                                },
                                child: _obsecureText.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined))),
                      ),
                    );
                  }),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(31, 145, 144, 144),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Pet Description',
                          style: MyStyle().heading2,
                        ),

                        // name form field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            focusNode: _petNameFocusNode,
                            controller: _petNameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                "Pet Name",
                              ),
                              prefixIcon: Icon(Icons.pets_outlined),
                            ),
                            onFieldSubmitted: (value) => FocusScope.of(context)
                                .requestFocus(_weightFocusNode),
                          ),
                        ),
                        // pet type field
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pet Type : ",
                                  style: MyStyle().subText,
                                ),
                                DropdownButton(
                                  value: petType,
                                  underline: Container(
                                    width: 150,
                                    height: 2,
                                    color: AppColors().appBar_theme,
                                  ),
                                  items: MyConstants().petType.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    if (value is String) {
                                      setState(() {
                                        petType = value;
                                      });
                                    }
                                  },
                                ),
                                addHorizontalSpace(20)
                              ],
                            )),

                        // pet breed type
                        breedSelection(petType),

                        // pet gender selection
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Pet\'s Gender : ',
                                style: MyStyle().subText,
                              ),
                              Radio(
                                value: 'Male',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(fontSize: 18),
                              ),
                              Radio(
                                value: 'Female',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),

                        // age picker section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Age",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: _width * 0.7,
                                // age slider picker
                                child: Slider(
                                  value: _initialAge,
                                  min: 1.0, // min age allowed
                                  max: 20.0, // max age allowed
                                  divisions: 19, // number of divisions allowed
                                  // updating age on slider change
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _initialAge = newValue;
                                    });
                                  },
                                  activeColor: AppColors().appBar_theme,
                                  inactiveColor: Colors.black45,
                                ),
                              ),
                              Text(
                                _initialAge.toInt().toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),

                        // Weight textform field
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            focusNode: _weightFocusNode,
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Pet's Weight"),
                              prefixIcon: Icon(Icons.monitor_weight_outlined),
                            ),
                            // requesting for password field focus
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // agreement to term and conditions
              Row(
                children: [
                  Checkbox(
                      value: _checkBoxValue,
                      onChanged: ((value) {
                        setState(() {
                          _checkBoxValue = !_checkBoxValue;
                        });
                      })),
                  const Text('Agree to'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesName.termsAndConditions);
                      },
                      child: const Text('Term and Conditions'))
                ],
              ),
              addVerticalSpace(15),

              Buttons(
                text: "Register",
                onPress: () async {
                  // checking for name length
                  if (_nameController.text.isEmpty) {
                    Message.flushBarErrorMessage(context, "Enter a valid Name");
                  }

                  // checking for email format and length
                  else if (_emailController.text.isEmpty ||
                      !isEmail(_emailController.text)) {
                    Message.flushBarErrorMessage(
                        context, "Enter a valid Email address");
                  }
                  // checking for password length validation
                  else if (_passwordController.text.length < 6) {
                    Message.flushBarErrorMessage(
                        context, "Password must be at least 6 digits");
                    // checking if user agrees to terms and conditions of application
                  } else if (!_checkBoxValue) {
                    Message.flushBarErrorMessage(
                        context, "Accept to terms and conditions to proceed");
                  } else {
                    try {
                      Registration registerDetails = Registration(
                          petOwnerName: _nameController.text,
                          petName: _petNameController.text,
                          email: _emailController.text,
                          petType: petType,
                          dogBreed: dogBreed,
                          catBreed: catBreed,
                          petGender: _gender,
                          age: _initialAge.toInt(),
                          petWeight: double.parse(_weightController.text));

                      // saving the data onto cloud firestore database
                      AuthenticationBase auth = Authentication();
                      auth.createUserWithEmailAndPassword(
                        context,
                        registerDetails,
                        _passwordController.text.trim(),
                      );
                      Navigator.pop(context);
                      // catch any exceptions occured
                    } catch (e) {
                      Message.flushBarErrorMessage(context, e.toString());
                    }
                  }
                },
              ),
              addVerticalSpace(15),
            ],
          ),
        ],
      ),
    );
  }

  // breed selection
  breedSelection(String petType) {
    switch (petType) {
      case 'Dog':
        return // pet type field
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pet Breed : ",
                      style: MyStyle().subText,
                    ),
                    DropdownButton(
                      value: dogBreed,
                      underline: Container(
                        width: 150,
                        height: 2,
                        color: AppColors().appBar_theme,
                      ),
                      items: MyConstants().dogBreeds.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        if (value is String) {
                          setState(() {
                            dogBreed = value;
                          });
                        }
                      },
                    ),
                    addHorizontalSpace(20)
                  ],
                ));
      case 'Cat':
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pet Breed : ",
                  style: MyStyle().subText,
                ),
                DropdownButton(
                  value: catBreed,
                  underline: Container(
                    width: 150,
                    height: 2,
                    color: AppColors().appBar_theme,
                  ),
                  items: MyConstants().catBreeds.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    if (value is String) {
                      setState(() {
                        catBreed = value;
                      });
                    }
                  },
                ),
                addHorizontalSpace(20)
              ],
            ));

      default:
        return const Text('');
    }
  }
}
