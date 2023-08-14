import 'package:flutter/material.dart';
import 'package:kon_app/widgets/custom_container.dart';

class StoreItem extends StatelessWidget {
  final String name;

  const StoreItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainer(
          width: 403,
          height: 130,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              CustomContainer(
                  width: 115,
                  height: 115,
                  child: Image.asset("assets/icons/no_image.png")),
              const SizedBox(
                width: 20,
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'Turkiya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    '28 ta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        '29\$',
                        style: TextStyle(
                          color: Color(0xFFFA5353),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '36\$',
                        style: TextStyle(
                          color: Color(0xFF269400),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '17-03-2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
