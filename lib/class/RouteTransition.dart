// Route _createRoute() {
//     return PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) =>
//             const HomeScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(begin: begin, end: end);
//           final curvedAnimation = CurvedAnimation(
//             parent: animation,
//             curve: curve,
//           );

//           return SlideTransition(
//             position: tween.animate(curvedAnimation),
//             child: child,
//           );
//         });
//   }