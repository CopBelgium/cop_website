List<NavItem> navItems = [
  NavItem(
    title: 'Home',
    subMenus: [],
  ),
  NavItem(
    title: 'Districts',
    subMenus: ['Antwerp District', 'Brussels District', 'Gent District'],
  ),
  NavItem(
    title: 'Ministries',
    subMenus: [
      'Pemem',
      'Evangelism ministry',
      'Women\'s ministry',
      'Youth ministry',
      'Children\'s ministry',
    ],
  ),
  NavItem(
    title: 'About us',
    subMenus: [
      'Values',
      'Tenets',
      'Leadership',
      'The Covenent',
      'Mission & Vission',
    ],
  ),
  NavItem(
    title: 'Contact us',
    subMenus: [],
  ),
];

class NavItem {
  String title;
  List<String> subMenus;
  NavItem({
    required this.title,
    required this.subMenus,
  });

  @override
  String toString() => 'NavItem(title: $title, subMenus: $subMenus)';
}
