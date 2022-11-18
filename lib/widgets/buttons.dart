
import 'package:flutter/material.dart';
import 'package:test/widgets/spacings.dart';







class TestButton extends StatelessWidget {
  const TestButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
          splashColor: Colors.white,
          onTap: onTap,
          child: Container(
            width: 366,
            height: 50,
            decoration:  const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.blue,
                         
                          backgroundColor: Colors.white,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                      const XMargin(5),
                Text(
                  title,
                  style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppings',
                    fontWeight: FontWeight.w400,
                  ), 
                ),
                const SizedBox(
                  width: 10,
                ),
           
              ],
            ),
          )),
    );
  }
}
