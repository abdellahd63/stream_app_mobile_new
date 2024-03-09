import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stream_app_mobile_new/Constant.dart';
import 'Views/FollowMyProduct/Suivremonproduit.dart';
import 'Views/MyTicket/Recep.dart';
import 'dart:io';
import 'package:intl/intl.dart';
class APIs {
  static const API_URL = Constant.API_URL;
  static Future<void> createAndDownloadPdf(context,nameController, surnameController, emailController,
      numberController, refController, typeController, wilayaController, centreController,
      dateController, PostalCodeController) async {
    try {
      final response = await http.post(
        Uri.parse('${API_URL}/EmailGenerator/createPDF/BonV1'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Nom': nameController.text,
          'Prenom': surnameController.text,
          'Email': emailController.text,
          'Telephone': numberController.text,
          'ReferanceProduit': refController.text,
          'TypePanne': typeController.text,
          'Wilaya': wilayaController.text,
          'CentreDepot': centreController.text,
          'DateDepot': dateController.text,
          'type': 'BD',
          'postalCode': PostalCodeController.text ?? "00",
        }),
      );

      if (response.statusCode != 200) {
        Navigator.pop(context);
        throw Exception('Error generating PDF');
      }
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        var filepath = responseBody['uniqueFilename'];

        await createNewPanne(context,filepath, nameController, surnameController, emailController,
            numberController, refController, typeController, wilayaController, centreController,
            dateController);
      }

    } catch (error) {
      print('Fetch error: $error');
    }
  }
  static Future<void> createNewPanne(BuildContext context,String? PDFFilename, nameController, surnameController, emailController,
      numberController, refController, typeController, wilayaController, centreController,
      dateController) async {
   if(PDFFilename != null && !PDFFilename.isEmpty){
     final data = {
       'Nom': nameController.text,
       'Prenom': surnameController.text,
       'Email': emailController.text,
       'Telephone': numberController.text,
       'ReferanceProduit': refController.text,
       'TypePanne': typeController.text,
       'Wilaya': wilayaController.text,
       'CentreDepot': centreController.text,
       'DateDepot': dateController.text,
       'PDFFilename': PDFFilename,
     };

     final response = await http.post(
       Uri.parse('${API_URL}/Pannes'),
       body: jsonEncode(data),
       headers: {'Content-Type': 'application/json'},
     );

     if (response.statusCode == 200) {
       // Successful POST request
       var responsePanneData = json.decode(response.body)['Panne'];
       // Close the dialog
       Navigator.pop(context);
       Navigator.push(
         context,
         PageTransition(
           type: PageTransitionType.rightToLeft,
           duration: Duration.zero,
           child: Recep(PanneData: responsePanneData),
         ),
       );
     } else {
       // Handle the error in case of an unsuccessful request
       var responseMessage = json.decode(response.body)['message'];
       Navigator.pop(context);
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           content: Text('${responseMessage}'),
         ),
       );
     }
   }else{
     print('PDFFilename is null');
   }
  }
  static Future<void> GetPanneByBD(BuildContext context, NumBonController) async {
    try {
      if(NumBonController.isEmpty){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('s\'il vous plaît entrer le numero de votre bon de depot'),
          ),
        );
        return;
      }
      final response = await http.get(
        Uri.parse('${API_URL}/Pannes/BD/${NumBonController}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var responsePanneData = json.decode(response.body)['Panne'];
        // Close the dialog
        Navigator.pop(context);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType
                    .bottomToTop,
                duration: Duration.zero,
                child: Suivremonproduit(PanneData: responsePanneData)
            )
        );
      } else {
        var responseMessage = json.decode(response.body)['message'];
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${responseMessage}'),
          ),
        );
      }
    } catch (error) {
      print('Error fetching Agent data: $error');
    }
  }
  static Future<void> downloadPDFFile(BuildContext context, String filename) async {
    try {
      final response = await http.get(
        Uri.parse('${API_URL}/EmailGenerator/downloaderPDF/$filename'),
      );
      if (response.statusCode == 200) {
        // If the file exists, trigger the download
        final blob = response.bodyBytes;
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/$filename';

        // Save the PDF to the device's local storage
        await File(path).writeAsBytes(blob);
        // Close the dialog
        Navigator.pop(context);
        // Display a success notification
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File downloaded successfully'),
          ),
        );

      } else if (response.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File not found'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error downloading the file'),
          ),
        );
      }
    } catch (error) {
      print(error);
    }
  }
  static Future<List<dynamic>> GetProductData() async {
    try {
      var productData = <dynamic>[];
      final response = await http.get(
        Uri.parse('${API_URL}/Product'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productData = data;
        return productData;
      } else {
        print('Error receiving product data: ${response.body}');
      }
    } catch (error) {
      print('Error fetching product data: $error');
    }

    // Return an empty list in case of an error
    return [];
  }
  static Future<List<dynamic>> GetWilayaData() async {
    try {
      var willayaData = <dynamic>[];
      final response = await http.get(
        Uri.parse('${API_URL}/Willaya'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        willayaData = data;
        return willayaData;
      } else {
        print('Error receiving willaya data: ${response.body}');
      }
    } catch (error) {
      print('Error fetching willaya data: $error');
    }
    // Return an empty list in case of an error
    return [];
  }
  static Future<List<dynamic>> GetSavData() async {
    try {
      var SavData = <dynamic>[];

      final response = await http.get(
        Uri.parse('${API_URL}/SAV'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final responseAgent = await http.get(
        Uri.parse('${API_URL}/Agent'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 && responseAgent.statusCode == 200) {
        final data = json.decode(response.body);
        final dataAgent = json.decode(responseAgent.body);
        SavData = data;
        SavData += dataAgent;
        return SavData.toList();
      } else {
        print('Error receiving SAV data: ${response.body}');
      }
    } catch (error) {
      print('Error fetching Agent data: $error');
    }
    // Return an empty list in case of an error
    return [];
  }
  static String formatDate(String dateString) {
    final date = DateTime.parse(dateString).toLocal();

    final monthNames = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];

    final month = monthNames[date.month - 1];
    final day = date.day;
    final year = date.year;
    final hours = DateFormat('HH').format(date);
    final minutes = DateFormat('mm').format(date);

    final formattedDate =
        '$month $day, $year at ${hours.padLeft(2, '0')}:${minutes.padLeft(2, '0')}';

    return formattedDate;
  }
}