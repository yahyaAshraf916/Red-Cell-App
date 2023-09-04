import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_cell_app/home.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/signUp/signUp_screen.dart';

import '../../firebase_services/auth.dart';
import 'ForgotPassword.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool isVisable = false;

  GlobalKey<FormState> myKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Text("login",
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 25,
        //         fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: sizeScreen * .1,
              ),

              ///login with face and google
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton.icon(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.facebook,
              //         color: Colors.blue,
              //       ),
              //       label: const Text(
              //         "FACEBOOK",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Color(0xff3E6AB2),
              //             fontWeight: FontWeight.bold),
              //       ),
              //       style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(
              //             Colors.white,
              //           ),
              //           padding: MaterialStateProperty.all(
              //               const EdgeInsets.symmetric(
              //                   vertical: 20, horizontal: 30)),
              //           shape: MaterialStateProperty.all(
              //               RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(7),
              //                   side: BorderSide(
              //                       color: Color.fromARGB(109, 255, 255, 255),
              //                       style: BorderStyle.solid)))),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     ElevatedButton.icon(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.g_mobiledata,
              //         color: Colors.red,
              //       ),
              //       label: const Text(
              //         "GOOGLE",
              //         style: TextStyle(
              //             fontSize: 17,
              //             color: Color(0xff39A751),
              //             fontWeight: FontWeight.bold),
              //       ),
              //       style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all(
              //             Colors.white,
              //           ),
              //           padding: MaterialStateProperty.all(
              //               EdgeInsets.symmetric(
              //                   vertical: 20, horizontal: 33)),
              //           shape: MaterialStateProperty.all(
              //               RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(7),
              //                   side: BorderSide(
              //                       color: Color.fromARGB(109, 255, 255, 255),
              //                       style: BorderStyle.solid)))),
              //     ),
              //   ],
              // ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                child: Text("Glad to see you !",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.left),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("LOGIN ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: sizeScreen * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(
                    label:const Text(
                      "Email address",
                      
                    ),
                    
                     labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (email) {
                    return email!.contains(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                        ? null
                        : "Enter a valid email";
                        
                  },
                 //showCursor: false,
                ),
              ),

              SizedBox(
                height: sizeScreen * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: isVisable ? false : true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: isVisable
                          ? Icon(
                              Icons.visibility,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            ),
                    ),
                    label: const Text(
                      " Password",
                      
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    return value!.length < 8
                        ? "Enter at least 8 characters"
                        : null;
                  },
                //  showCursor: false,
                ),
              ),

              SizedBox(
                height: sizeScreen * .06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: InkWell(
                  onTap: () async {
                    myKey.currentState!.validate();
                    setState(() {
                      isLoading = true;
                    });
                    await AuthMethod().signIn(
                        emailAddress: emailController.text,
                        password: passwordController.text,
                        context: context);
                    setState(() {
                      isLoading = false;
                    });
                   
                    //  uId = FirebaseAuth.instance.currentUser!.uid;
                   
                    //   SocialCubit.get(context).getUsers();
                  },
                  child: Container(
                    //margin: EdgeInsets.all(18),
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF8585A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : const Text(
                            "Login ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()),
                  );
                },
                child: const Text("Forgot password?",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    textAlign: TextAlign.right),
              ),

              SizedBox(
                height: sizeScreen * .06,
              ),

              Stack(
                children: [
                  const Image(
                    image: AssetImage("assets/icons/log_buttom.png"),
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 60,
                    top: 60,
                    bottom: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
                          child: const Text(
                            "Sign UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
