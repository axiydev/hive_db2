import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_db2/models/user_model.dart';
import 'package:hive_db2/pages/signup_page.dart';
import 'package:hive_db2/services/hive_service.dart';
class SignIn extends StatefulWidget{
  static const String id='signin_page';
  @override
  _SignInState createState()=>_SignInState();
}
class _SignInState extends State<SignIn>{
  final _emailController=new TextEditingController();
  final _passController=new TextEditingController();
  void _doLogin()async{
    String email=_emailController.text.toString().trim();
    String pass=_passController.text.toString().trim();
    var user=new User(email:email,password: pass);
    HiveDB.storeUser(user);

  //  tekshirish uchun
    Map<String,dynamic> mp=await HiveDB.loadUser();
    var us1=new User.fromJsom(mp);
    print(us1.email);
    print(us1.password);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Color.fromRGBO(7, 127, 123,1),
      body:Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child:Column(
          children:[
            Expanded(
              flex:3,
              child:Container(
                padding:EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                height: double.infinity,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                   // #image
                   Container(
                     height: 40,
                     width:40,
                     decoration: BoxDecoration(
                       shape:BoxShape.circle,
                       image:DecorationImage(
                         image:AssetImage('assets/images/ic_profil.jpg'),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                  SizedBox(height: 16,),
                    //#welcome
                    RichText(
                      textAlign: TextAlign.start,
                      text:TextSpan(
                        text: 'Welcome\n',
                        style:GoogleFonts.roboto(
                          color: Color.fromRGBO(41, 168, 164, 1),
                          fontSize: 16,
                          height: 1.3,
                          letterSpacing: 1
                        ),
                        children: [
                          TextSpan(
                            text:'Sign In',
                            style:GoogleFonts.roboto(
                              color:Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex:8,
              child:Container(
                height: double.infinity,
                width: double.infinity,
                padding:EdgeInsets.only(left: 40,right: 40,top:70),
                decoration:BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.only(topRight:Radius.circular(40),topLeft: Radius.circular(40)),
                ),
                child:SingleChildScrollView(
                  child:Column(
                    children:[
                     Container(
                       width: double.infinity,
                       child:Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                         //email
                           Container(
                             width:double.infinity,
                             child:Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:[
                                 Container(
                                   padding:EdgeInsets.only(left: 5),
                                   child:Text('Email',style: GoogleFonts.roboto(
                                     color:Colors.black,
                                     fontSize: 17,fontWeight: FontWeight.w500,
                                   ),
                                   ),
                                 ),
                                 //textfield
                                 Container(
                                   decoration:BoxDecoration(
                                     border: Border(
                                       bottom: BorderSide(
                                         width: 2,
                                         color:Colors.grey[300],
                                       ),
                                     ),
                                   ),
                                   child:TextField(
                                     controller: _emailController,
                                     style: GoogleFonts.poppins(
                                       color:Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                     ),
                                     decoration:InputDecoration(
                                       contentPadding: EdgeInsets.only(left: 5),
                                       border:InputBorder.none,
                                       hintText:'Urmail@gmail.com',
                                       hintStyle: GoogleFonts.poppins(
                                         color:Colors.black,
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(height: 30,),
                           //#password
                           Container(
                             width:double.infinity,
                             child:Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:[
                                 Container(
                                   padding:EdgeInsets.only(left: 5),
                                   child:Text('Password',style: GoogleFonts.roboto(
                                     color:Colors.black,
                                     fontSize: 17,fontWeight: FontWeight.w500,
                                   ),
                                   ),
                                 ),
                                 //textfield
                                 Container(
                                   decoration:BoxDecoration(
                                     border: Border(
                                       bottom: BorderSide(
                                         width: 2,
                                         color:Colors.grey[300],
                                       ),
                                     ),
                                   ),
                                   child:TextField(
                                     controller: _passController,
                                     obscureText: true,
                                     style: GoogleFonts.poppins(
                                       color:Colors.black,
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                     ),
                                     decoration:InputDecoration(
                                       contentPadding: EdgeInsets.only(left: 5),
                                       border:InputBorder.none,
                                       hintText:'Enter Password',
                                       hintStyle: GoogleFonts.poppins(
                                         color:Colors.grey,
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           //#forgot password
                           Text('Forgot Password?',style:GoogleFonts.poppins(
                             color:Colors.grey,
                             fontSize: 15,
                             fontWeight: FontWeight.w500,
                           ),
                           ),
                           SizedBox(height: 20,),
                         //  #button
                           Container(
                             height: 50,
                             width: double.infinity,
                             child:FlatButton(
                               shape:RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child:Text('Sign In',style: GoogleFonts.poppins(
                                 color:Colors.white,
                                 fontSize:17,
                                 fontWeight: FontWeight.w500,
                               ),
                               ),
                               color:Color.fromRGBO(7, 127, 123,1),
                               onPressed: (){
                                 _doLogin();
                               },
                             ),
                           ),

                         ],
                       ),
                     ),
                     SizedBox(height: 15,),
                    //  #----------or------------
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child:Container(height: 1,color: Colors.grey[300],)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child:Text('OR',
                            style:GoogleFonts.roboto(
                              color:Colors.grey[300],
                              fontWeight: FontWeight.w500,
                              fontSize:16,
                            ),
                            ),
                          ),
                          Expanded(child:Container(height: 1,color: Colors.grey[300],))
                        ],
                      ),
                      SizedBox(height: 15,),
                      //#icons facebook twitter instagram
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        width: double.infinity,
                        height:30,
                        child: Row(
                          children:[
                            //#facebook
                            Expanded(
                              child:Container(
                                 child:Center(
                                    child:FaIcon(FontAwesomeIcons.facebookF,size: 25,color:Colors.blue[900]),
                                 ),
                              ),
                            ),
                            //#twitter
                            Expanded(
                              child:Container(
                                child:Center(
                                  child:FaIcon(FontAwesomeIcons.twitter,size: 25,color:Colors.blue),
                                ),
                              ),
                            ),
                            //#instagram
                            Expanded(
                              child:Container(
                                child:Center(
                                  child:FaIcon(FontAwesomeIcons.instagram,size: 25,color:Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                     SizedBox(height: 70,),
                    //  dont have an account
                    Container(
                      width: double.infinity,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an Account? ',style:GoogleFonts.roboto(
                            color:Colors.grey[400],
                            fontSize: 15
                          )),
                          GestureDetector(
                            child:Text('Sign Up',style:GoogleFonts.roboto(
                                color:Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            )),
                            onTap: ()async{
                              await Navigator.pushNamed(context,SignUp.id);
                            },
                          ),
                        ],
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}