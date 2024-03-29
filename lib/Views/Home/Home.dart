import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stream_app_mobile_new/Models/SAV.dart';
import 'package:stream_app_mobile_new/Views/GlobaleComponents/InputTextField.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/OpenTicket.dart';
import 'dart:core';

import '../../APIs.dart';
import 'Components/ListRow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchText = '';
  final NumBonController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  void scrolltotop() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 900),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: InkWell(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffb92b27), Color(0xff1565C0)])),
          ),
          onTap: () {
            scrolltotop();
          },
        ),
        title: Text(
          'Service apres vente',
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Ouvrir un ticket button
            Material(
              elevation: 10,
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(19),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [Color(0xffb92b27), Color(0xff1565C0)])),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Ouvrir un ticket
                      InkWell(
                        child: Material(
                          elevation: 10,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                          child: Container(
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffb92b27),
                                  Color(0xff1565C0)
                                ]),
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Colors.white, width: 1.25)),
                            child: Center(
                              child: Text(
                                'Ouvrir un ticket',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          //Navigate to second activity
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 300),
                                  child: OpenTicket()
                              )
                          )
                          ;
                        },
                      ),
                      const SizedBox(height: 25),
                      //suivre mon produit
                      InkWell(
                        child: Material(
                          elevation: 10,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                          child: Container(
                            padding: EdgeInsets.all(17),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffb92b27),
                                  Color(0xff1565C0)
                                ]),
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                    color: Colors.white, width: 1.25)),
                            child: Center(
                              child: Text(
                                'Suivre mon produit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          //hna dir functionnement ta3 button
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Suivre mon produit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InputTextField(
                                    title: "Numero de bon",
                                    hint:
                                    "Entrer le numero de votre bon de depot",
                                    controller: NumBonController,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: InkWell(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(10.0),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 10),
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  'Annuler',
                                                  style: TextStyle(
                                                    color: Color(0xffd4171b),
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        Center(
                                          child: InkWell(
                                            child: Container(
                                              margin:
                                              EdgeInsets.only(left: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25,
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Color(0XFFD4171B),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                'Valider',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                      title: Text('Veuillez être patient jusqu\'à la fin de ce processus...'),
                                                      content: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          CircularProgressIndicator(),
                                                        ],
                                                      ),
                                                  );
                                                },
                                              );
                                              await APIs.GetPanneByBD(context, NumBonController.text.toString());
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 0.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Trouver un SAV',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 0.5,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      //region searching
                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(62, 255, 255, 255),
                          hintText: 'ex : ALGER',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(CupertinoIcons.search),
                          prefixIconColor: Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: APIs.GetSavData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            CircularProgressIndicator(),
                            ],
                            ),
                        )
                      );
                    } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Aucun SAV disponible.');
                    } else {
                      List<SAV> SAVList = List<SAV>.from(snapshot.data!.map((sav) => SAV.fromJson(sav)));
                      List<SAV> filteredSAVList = SAVList.where((sav) =>
                          sav.Region.toLowerCase().contains(searchText.toLowerCase())
                      ).toList();
                      if (filteredSAVList.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Aucun SAV trouvé pour "${searchText}".',
                            style: TextStyle(
                              fontSize: 16, // Adjust the font size as needed
                              fontWeight: FontWeight.normal, // Adjust the font weight as needed
                              color: Colors.black, // Adjust the text color as needed
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: filteredSAVList.length,
                          itemBuilder: (context, index){
                            return ListRow(
                                City: filteredSAVList[index].Region,
                                Phone: filteredSAVList[index].Telephone,
                                adresse: filteredSAVList[index].Adresse,
                                Url: filteredSAVList[index].Localisation
                            );
                          }
                      );
                    }
                  },
                )
            )
          ],
        ),
    );
  }
  @override
  // TODO: implement widget
  Widget btt(ScrollController _scrollController, bool backtotop) => backtotop
      ? Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: FloatingActionButton.extended(
          onPressed: () {
            _scrollController.animateTo(0,
                duration: Duration(seconds: 1), curve: Curves.linear);
          },
          label: Text('haut de la page')),
    ),
  )
      : SizedBox();

}
