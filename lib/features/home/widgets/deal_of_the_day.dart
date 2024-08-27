import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          child: Text(
            'Deal of the day',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        ),
        Image.network('https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGFwdG9wfGVufDB8fDB8fHww',
        height: 230,
        fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15),
          child: Text(
            '\$4000.00',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ), 
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 5, right: 35),
          child: Text(
            'Macbook Air',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://media.istockphoto.com/id/1410249336/photo/mock-up-computer-with-natural-flower-glasses-and-coffee-cup-over-the-wooden-table.webp?s=612x612&w=0&k=20&c=i_g2z9gzt12iBEi3MOMi3fwprFablRkPR24G2IFKr_c=',
              fit: BoxFit.fill,
              height: 200,
              width: 200,
              ),
          
               Image.network('https://media.istockphoto.com/id/1410249336/photo/mock-up-computer-with-natural-flower-glasses-and-coffee-cup-over-the-wooden-table.webp?s=612x612&w=0&k=20&c=i_g2z9gzt12iBEi3MOMi3fwprFablRkPR24G2IFKr_c=',
               fit: BoxFit.fill,
              height: 200,
              width: 200,
              ),
          
               Image.network('https://media.istockphoto.com/id/1410249336/photo/mock-up-computer-with-natural-flower-glasses-and-coffee-cup-over-the-wooden-table.webp?s=612x612&w=0&k=20&c=i_g2z9gzt12iBEi3MOMi3fwprFablRkPR24G2IFKr_c=',
               fit: BoxFit.fill,
              height: 200,
              width: 200,
              ),
          
               Image.network('https://media.istockphoto.com/id/1410249336/photo/mock-up-computer-with-natural-flower-glasses-and-coffee-cup-over-the-wooden-table.webp?s=612x612&w=0&k=20&c=i_g2z9gzt12iBEi3MOMi3fwprFablRkPR24G2IFKr_c=',
              height: 200,
              width: 100,
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}