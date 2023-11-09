import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stream_app_mobile_new/Views/GlobaleComponents/InputTextField.dart';
import 'package:stream_app_mobile_new/Views/GlobaleComponents/CancelButton.dart';
import 'package:stream_app_mobile_new/Views/Home/Home.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/Datetimepicker.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/RefProductSelect.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/SavSelect.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/TypePanneSelect.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/ValiderButton.dart';
import 'package:stream_app_mobile_new/Views/OpenTicket/Components/WillayaSelect.dart';

class OpenTicket extends StatelessWidget {
  OpenTicket({super.key});

   final nameController=TextEditingController();
  final surnameController=TextEditingController();
  final emailController=TextEditingController();
  final numberController=TextEditingController();
  final refController=TextEditingController();
  final typeController=TextEditingController();
  final wilayaController=TextEditingController();
  final PostalCodeController=TextEditingController();
  final centreController=TextEditingController();
  final dateController=TextEditingController();
  List<dynamic> ProductData = <dynamic>[];
  List<dynamic> WilayaData = <dynamic>[];
  List<dynamic> SavData = <dynamic>[];
  List<String> TypePanneData = [
    'Blocage',
    'Blocage logo',
    'Problème d\'afficheur',
    'Problème de télécommande',
    'Problème d\'affichage',
    'Écran noir',
    'Écran blanc',
    'Écran bleu',
    'Problème de couleur',
    'Problème d\'allumage',
    'Problème de carte mère',
    'Problème de led',
    'Problème de démo',
    'Ne démarre pas',
    'Problème HDMI',
    'Problème USB',
    'Problème du son',
    'Problème de mise à jour',
    'Problème de connectivité',
    'Problème d\'application',
    'Tache sur écran',
    'Trait sur écran (vertical)',
    'Trait sur écran (horizontal)',
    'Autres',
  ];
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.grey[200],
                  shadowColor: Colors.transparent,
                  centerTitle: true,
                  toolbarHeight: 90,
                  title: Text(
                    'Ouvrir un ticket',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffD4171b),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: const Icon(Icons.close, color: Color(0xffD4171b)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "Veulliez remplir ce formulaire",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Form(
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InputTextField(hint: 'Entrer votre nom', title: 'Nom :',controller: nameController,),
                                //prenom
                                InputTextField(hint: 'Entrer votre prenom', title: 'Prenom :',controller: surnameController,),
                                //Email
                                InputTextField(hint: 'Entrer votre email', title: 'Email :',controller: emailController,),
                                //numero
                                InputTextField(hint: 'Entrer votre numero de telephone', title: 'Numero de telephone :',controller: numberController,),
                                //Referance
                                RefProductSelect(hint: 'Selectionner la referance du produit', title: 'Referance produit :', items: ProductData, controller: refController),
                                //TYPE DE PANNE
                                TypePanneSelect(hint: 'Selectionner le type de panne', title: 'Type de panne :', items: TypePanneData, controller:  typeController),
                                //WILAYA
                                WillayaSelect(hint: 'Selectionner la wilaya', title: 'Wilaya :', items: WilayaData, controller: wilayaController, code: PostalCodeController),
                                //Centre Sav
                                SavSelect(hint: 'Selectionner le centre de depot', title: 'Centre de depot :', items: SavData, controller: centreController),
                                //Date de depot
                                Datetimepicker(controller: dateController),
                                const SizedBox(height: 17),
                                //Valider
                                InkWell(
                                  child: ValiderButton(),
                                  onTap: () async {
                                    createAndDownloadPdf();
                                  },
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  child: CancelButton(text: 'Annuler',),
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.leftToRight,
                                            duration: Duration.zero,

                                            child: Home())

                                    );
                                  },
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isProcessing) // Show circular progress indicator
            Container(
              color: Colors.white.withOpacity(1.0), // White background with full opacity
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Veuillez être patient jusqu\'à la fin de ce processus...',
                    style: TextStyle(
                      color: Colors.red, // Red text color
                      fontSize: 15, // Font size 22
                      fontWeight: FontWeight.bold, // Bold text
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}