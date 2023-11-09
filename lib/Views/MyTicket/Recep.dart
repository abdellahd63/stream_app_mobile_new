import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stream_app_mobile_new/Views/GlobaleComponents/CancelButton.dart';
import 'package:stream_app_mobile_new/Views/Home/Home.dart';
import 'package:stream_app_mobile_new/Views/MyTicket/Components/TelechargerButton.dart';

class Recep extends StatelessWidget {
  const Recep({super.key});

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
                                '${widget.PanneData['Nom']+" "+widget.PanneData['Prenom']}',
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
                                '${widget.PanneData['Telephone']}',
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
                                '${widget.PanneData['ReferanceProduit']}',
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
                                '${widget.PanneData['TypePanne']}',
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
                                '${formatDate(widget.PanneData['DateDepot'].toString())}',
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
                                '${"SAV "+widget.PanneData['CentreDepot']}',
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
                  onTap: () {
                    //Telechargement du bon
                    downloadPDFFile('${widget.PanneData['BDPDFfile']}');
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
        ]
      ),

    );
  }
}