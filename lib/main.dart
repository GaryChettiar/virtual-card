import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MembershipCardFlip(),
  ));
}

class MembershipCardFlip extends StatefulWidget {
  const MembershipCardFlip({super.key});

  @override
  State<MembershipCardFlip> createState() => _MembershipCardFlipState();
}

class _MembershipCardFlipState extends State<MembershipCardFlip> {
  String userId = "user-id-12345-abcde";
  late String qrData;

  @override
  void initState() {
    super.initState();
    qrData = generateQR();
  }

  String generateQR() {
    return "$userId-${DateTime.now().millisecondsSinceEpoch}";
  }

  void refreshQR() {
    setState(() {
      qrData = generateQR();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Membership Card"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: buildFrontCard(),
                back: buildBackCard(),
              ),
            ),
             ElevatedButton.icon(
              onPressed: refreshQR,
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh QR"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFrontCard() {
    return Container(
      width: 320,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3633),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text Details
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Alex Ray",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                "Platinum Member",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          // Profile Icon
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white12,
            ),
            child:  Image.asset('assets/face.png'),
          ),
        ],
      ),
    );
  }

  Widget buildBackCard() {
    return Container(
      width: 320,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3633),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          QrImageView(
            embeddedImage: AssetImage('assets/face.png'),
  embeddedImageStyle: QrEmbeddedImageStyle(
    
    size: Size(55, 65),
  ),
          gapless: false,
            // foregroundColor: Colors.white,
            eyeStyle: QrEyeStyle(
              
              color: Colors.white
            ),
            dataModuleStyle: QrDataModuleStyle(
              color: Colors.white
            ),
            data: qrData,
            version: QrVersions.auto,
            size: 150,
            backgroundColor: const Color.fromARGB(53, 183, 182, 182),
          ),
          const SizedBox(height: 10),
         
        ],
      ),
    );
  }
}
