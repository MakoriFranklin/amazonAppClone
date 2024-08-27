import 'package:amazon_clone/features/profile/widgets/account_buttons.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Orders', onTap: (){}),
             AccountButton(text: 'Turn Seller', onTap: (){})
          ],
        ),

        const SizedBox(height: 10,),

        Row(
          children: [
            AccountButton(text: 'WishList', onTap: (){}),
            AccountButton(text: 'Logout', onTap: (){})
          ],
        )
      ],
    );
  }
}