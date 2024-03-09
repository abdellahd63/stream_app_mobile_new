import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stream_app_mobile_new/APIs.dart';
import 'package:stream_app_mobile_new/Views/GlobaleComponents/CancelButton.dart';
import 'package:stream_app_mobile_new/Views/Home/Home.dart';
import 'package:stream_app_mobile_new/Views/MyTicket/Components/TelechargerButton.dart';

class Recep extends StatelessWidget {
  final Map<String, dynamic> PanneData;
  Recep({super.key, required this.PanneData});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Stack(
        children:[
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Votre ticket
                const SizedBox(height: 50),
                Text('Votre ticket a été ouvert avec success',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffD4171b),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Text('Mon Ticket',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    ),
                ),
                const SizedBox(height: 20),
                Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Nom Complet :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${PanneData['Nom']+" "+PanneData['Prenom']}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                ),
                TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Numero telephone :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${PanneData['Telephone']}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                ),
                 TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Referance :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${PanneData['ReferanceProduit']}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                ),
                TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Type de panne :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${PanneData['TypePanne']}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                ),
                TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Date de depot :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${APIs.formatDate(PanneData['DateDepot'].toString())}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                ),
                TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Center(
                              child: Text(
                                'Centre de depot :',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child:Center(
                                child: Text(
                                '${"SAV "+PanneData['CentreDepot']}',
                                style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                  ]
                )],
                ),
                const SizedBox(height: 20),
                //button telecharger
                InkWell(
                  child: TelechargerButton(
                  ),
                  onTap: () async {
                    //Telechargement du bon
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
                    // Call the GetSavData function and await its result
                    if(!PanneData['BDPDFfile'].toString().isEmpty){
                      await APIs.downloadPDFFile(context,PanneData['BDPDFfile']);
                    }
                  },
                ),
                 const SizedBox(height: 10),
                InkWell(
                      child: CancelButton(text: "Revenir a l'acceuil"),
                      onTap: () {
                        Navigator.push(context, PageTransition(
                          child: Home(),
                          type: PageTransitionType.leftToRight)
                          );
                      },
                     )
              ],
            ),
          ),
          ),
        ),
        ]
      ),

    );
  }
}