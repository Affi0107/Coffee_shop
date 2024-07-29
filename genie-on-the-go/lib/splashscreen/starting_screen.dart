// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_2/cart/screen/cart.dart';
// // import 'package:project_2/cart/cart_screen/cart.dart';
// import 'package:project_2/myhomepage/pages/home_page/home_page.dart';

// import 'pageProvider/page_index.dart';

// // ignore: must_be_immutable
// class StartingScreen extends ConsumerWidget {
//   StartingScreen({super.key});

//   int _pageIndex = 0;

//   List pages = [
//     HomePage(),
//     Center(
//       child: Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/11.jpeg"), fit: BoxFit.fill)),
//         child: Center(child: Text("Search")),
//       ),
//     ),
//     Cart(),
//     Center(
//       child: Container(
//         child: Text("Profile"),
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _pageIndex = ref.watch(pageIndexProvider) as int;
//     return Scaffold(
//       body: pages[_pageIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.black,
//         onTap: (value) => ref.read(pageIndexProvider.notifier).pageIndex(value),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white24,
//         currentIndex: _pageIndex,
//         elevation: 0,
//         items: const [
//           BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//               activeIcon: Icon(Icons.home)),
//           BottomNavigationBarItem(
//               label: "Search",
//               icon: Icon(Icons.search),
//               activeIcon: Icon(Icons.search)),
//           BottomNavigationBarItem(
//               label: "Cart",
//               icon: Icon(Icons.shopping_cart_checkout_sharp),
//               activeIcon: Icon(Icons.shopping_cart_rounded)),
//           BottomNavigationBarItem(
//               label: "Profile",
//               backgroundColor: Colors.black,
//               icon: Icon(Icons.person),
//               activeIcon: Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }
