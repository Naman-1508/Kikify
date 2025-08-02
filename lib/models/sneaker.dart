class Sneaker{
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final List<String> availableSizes;
  Sneaker({required this.name, required this.imageUrl,required this.price,required this.description,required this.availableSizes});
}
List<Sneaker> dummySneakers = [
  Sneaker(
    name: 'Air Jordan 4 ‘Bred’',
    imageUrl: 'https://sneakerplug.co.in/cdn/shop/files/image_929e1702-711c-4c0b-8aa3-7b1dae4b8819.jpg?v=1686557655',
    price: 20000.0,
    description: 'Classic Jordan 4 silhouette with the iconic “Bred” colorway.',
    availableSizes: ['7', '8', '9', '10'],
  ),
  Sneaker(
    name: 'Yeezy Boost 350 V2',
    imageUrl: 'https://cdn-images.farfetch-contents.com/12/96/03/31/12960331_23445016_600.jpg',
    price: 40000.0,
    description: 'Comfort meets style with the revolutionary Boost technology.',
    availableSizes: ['6', '7', '8', '9'],
  ),
  Sneaker(
    name: 'Air Jordan SB Para Dunk',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH_qK2rhWyGaJ0WpbqcZ8YrC-sdqD8SI93eA&s',
    price: 50000.0,
    description: 'Skateboard-inspired Dunks with premium cushioning and artwork.',
    availableSizes: ['8', '9', '10'],
  ),
  Sneaker(
    name: 'Air Jordan Panda Dunk',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKjqjInuaeqejIEsLxF24RrIHj4fgtfht2fw&s',
    price: 70000.0,
    description: 'Crisp black-and-white design that fits any outfit.',
    availableSizes: ['7', '8', '9', '10', '11'],
  ),
  Sneaker(
    name: 'Air Jordan Chicago Bulls',
    imageUrl: 'https://highonkicks.com/cdn/shop/products/https___hypebeast.com_image_2022_01_air-jordan-1-high-zoom-cmft-chicago-black-toe-CT0979-610-release-date-3_1024x1024_2x_d1d29c60-3400-4525-afa7-ec5d9037ce8a.jpg?v=1668939746',
    price: 90000.0,
    description: 'Inspired by the Chicago Bulls with bold red and black accents.',
    availableSizes: ['6', '7', '8'],
  ),
  Sneaker(
    name: 'Air Jordan 1 Retro',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMQ75BPv7lLsndHhspahOnAmvjQ7iEpH1LnQ&s',
    price: 110000.0,
    description: 'Retro edition that pays homage to the original Jordan 1 design.',
    availableSizes: ['8', '9', '10', '11'],
  ),
  Sneaker(
    name: 'AJ 1 Reverse Mocha',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY78r4I_f5lv1zjjrJwnPMIyNe7mRbnGontQ&s',
    price: 130000.0,
    description: 'A Travis Scott special edition with reverse mocha tones.',
    availableSizes: ['7', '8', '9'],
  ),
  Sneaker(
    name: 'AJ 1 High OG Dior',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmOov65E3-zKaLSjOWWpYskkzDMsQ8ChNUcw&s',
    price: 800000.0,
    description: 'Luxury meets streetwear in this Dior x Jordan collaboration.',
    availableSizes: ['9', '10', '11'],
  ),
];