class Item {
  final String title;
  final String description;
  final String imagePath;
  final String url;
  final String date;

  Item({
    this.title,
    this.description,
    this.imagePath,
    this.url,
    this.date='',
  });
}

final sampleItems = <Item>[
  new Item(title: '', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus condimentum efficitur. Pellentesque ac libero sagittis, facilisis justo eu, ultrices ante.', imagePath: 'assets/1.jpg',),
  new Item(title: '', description: 'Suspendisse ac gravida diam, ut egestas lorem. Duis at velit vitae velit dictum tempus pharetra ut eros. Quisque ut leo sollicitudin, molestie diam ut, congue orci.', imagePath: 'assets/2.jpg',),
  new Item(title: '', description: 'Mauris vel felis velit. Nullam tincidunt, est id dapibus lacinia, dui ex fermentum nisl, vehicula elementum erat felis sit amet mauris.', imagePath: 'assets/3.jpg',),
  new Item(title: '', description: 'Morbi sed eros rhoncus, imperdiet ipsum id, euismod justo. Phasellus maximus vulputate erat quis mattis. Cras volutpat tellus at massa sollicitudin, ac bibendum augue ultrices.', imagePath: 'assets/4.jpg',),
  new Item(title: '', description: 'Quisque id tellus ullamcorper sem eleifend consequat. Morbi vestibulum risus nec quam suscipit, sed molestie mauris maximus. In lacinia tincidunt mollis.', imagePath: 'assets/5.jpg',),
];
