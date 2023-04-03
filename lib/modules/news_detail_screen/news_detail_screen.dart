import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  int LikeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Direktorat Jenderal Pajak",
      //   ),
      // ),
      body: Column(
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/d/d9/Megawati_Sukarnoputri_in_hijab_%28cropped%29.png",
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Megawati',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Prof. Dr. (H.C.)[2] Hj. Diah Permata Megawati Setiawati Soekarnoputri (lahir 23 Januari 1947) adalah Presiden Indonesia yang kelima yang menjabat sejak 23 Juli 2001 sampai 20 Oktober 2004. Ia merupakan presiden wanita Indonesia pertama dan putri dari presiden Indonesia pertama, Soekarno, yang kemudian mengikuti jejak ayahnya menjadi Presiden Indonesia. Pada 20 September 2004, ia kalah suara dari Susilo Bambang Yudhoyono dalam Pemilu Presiden 2004 putaran yang kedua.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Row(children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  Text(' $LikeCount')
                ])
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        hoverColor: Colors.red,
        onPressed: () {
          setState(() {
            LikeCount++;
          });
          print(LikeCount);
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
