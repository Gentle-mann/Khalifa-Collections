import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.child,
  });
  final Future<dynamic> future;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Text('Error Found: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: ((context, index) {
                  // final data = snapshot.data![index];
                  return const SizedBox();
                }));
          }
        });
  }
}
