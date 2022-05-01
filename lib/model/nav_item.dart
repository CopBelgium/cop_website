class NavItem {
  String title;
  List<String> subMenu;
  NavItem({
    required this.title,
    required this.subMenu,
  });

  @override
  String toString() => 'NavItem(title: $title, subMenus: $subMenu)';
}

List<NavItem> navItems = [
  NavItem(
    title: 'Home',
    subMenu: [],
  ),
  NavItem(
    title: 'Districts',
    subMenu: ['Antwerp District', 'Brussels District', 'Gent District'],
  ),
  NavItem(
    title: 'Ministries',
    subMenu: [
      'Pemem',
      'Evangelism ministry',
      'Women\'s ministry',
      'Youth ministry',
      'Children\'s ministry',
    ],
  ),
  NavItem(
    title: 'About us',
    subMenu: [
      'Values',
      'Tenets',
      'Leadership',
      'The Covenent',
      'Mission & Vission',
    ],
  ),
  NavItem(
    title: 'Contact us',
    subMenu: [],
  ),
];
