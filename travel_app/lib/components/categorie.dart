import 'package:flutter/material.dart';
import 'package:travel_app/components/card_category.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/interessi.dart';

class Categorie extends StatelessWidget {
  const Categorie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Titolo('Category'),
        SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Interessi.values.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      const CardCategory(
                        color: Colors.red,
                        icon: Icons.spa,
                        text: 'all',
                      ),
                      CardCategory(
                        color: Interessi.values[index].color,
                        icon: Interessi.values[index].icon,
                        text: Interessi.values[index].name,
                        marginRight: index != (Interessi.values.length - 1),
                      )
                    ],
                  );
                }

                return CardCategory(
                  color: Interessi.values[index].color,
                  icon: Interessi.values[index].icon,
                  text: Interessi.values[index].name,
                  marginRight: index != (Interessi.values.length - 1),
                );
              }),
        )
      ],
    );
  }
}
