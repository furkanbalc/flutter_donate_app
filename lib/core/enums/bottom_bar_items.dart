enum BottomBarItems {
  home('Ana Sayfa'),
  product('İlanlar'),
  message('Mesaj'),
  profile('Profil'),
  ;

  final String value;
  const BottomBarItems(this.value);
}
// enum AppNavBarItems {
//   product,
//   message,
//   add,
//   home,
//   profile
// }

// extension AppNavBarItemsExtension on AppNavBarItems {
//   String get value {
//     switch (this) {
//       case AppNavBarItems.product:
//         return 'İlanlar';
//       case AppNavBarItems.message:
//         return 'Mesaj';
//       case AppNavBarItems.add:
//         return 'Ekle';
//       case AppNavBarItems.home:
//         return 'Ana Sayfa';
//       case AppNavBarItems.profile:
//         return 'Profil';
//       default:
//         return '';
//     }
//   }
// }