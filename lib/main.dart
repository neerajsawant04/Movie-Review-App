import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  MovieAppState createState() => MovieAppState();

  static MovieAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MovieAppState>();
}

class MovieAppState extends State<MovieApp> {
 ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.yellow,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.anton(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: GoogleFonts.anton(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      themeMode: _themeMode,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MovieHomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: GoogleFonts.anton(fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: isDarkMode,
                onChanged: (value) {
                  final movieApp = MovieApp.of(context);
                  if (movieApp != null) {
                    movieApp.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/abstract-solid-shining-yellow-gradient-studio-wall-room-background_1258-70808.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "          CineStrem",
          style: GoogleFonts.anton(
            color: const Color.fromARGB(255, 0, 0, 0),
           
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              final movieApp = MovieApp.of(context);
              if (movieApp != null) {
                movieApp.setThemeMode(
                  Theme.of(context).brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildFeaturedMoviePanel(context),
          const SizedBox(height: 20),
          _buildHorizontalScrollablePanel(
            context,
            title: 'Trending Movies',
             
            movieImages: [
{
                'url':
                    'https://images.moneycontrol.com/static-mcnews/2024/10/20241009184828_Ratan-Tata-2-TT.jpg',
                'title': 'Swatantra Veer Savarkar',
                'rating': '4.8',
                'detailImage': 'https://www.hindustantimes.com/ht-img/img/2024/03/26/1600x900/Savarkar_1653715564344_1711427818301.jpeg',
                'description': 'Swatantra Veer Savarkar is a biographical film about Vinayak Damodar Savarkar, a freedom fighter, writer, and leader in India’s struggle for independence. The movie traces his life, from his early years as a revolutionary to his imprisonment in the Andaman Cellular Jail. It highlights his ideas on Hindu nationalism, his opposition to British rule, and his contribution to the independence movement. The film also explores his controversial views on religion, politics, and his role in shaping India’s history. Through personal sacrifices, Savarkar emerges as a complex figure, deeply dedicated to India’s freedom and identity.',
                'cast': [
                  {'name': 'Randeep Hooda', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSh7727tCY8ZsTjIq0pyL21UANFWffvBk7FjIAmQi15vLQMkqk8_aoMSCqdi8jXHo9y0AJ-emoqfS_1qwb0pPZ9MsWKWcaryJUMuVd_Cok'},
                  {'name': 'Ankita Lokhande', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgfiQ8d_EttGEk6gRNi994OlRpbLMvT8FjOAgYRrAJRW4JfPSD'},
                  {'name': 'Amit Sial', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsr1L53YTniIgDDzCyutLk4-3uPMdk_-pDQYoixQJwS4ocj5GxppUe2VYPJxEubz6Mdsb14AF1QwGn87tgEfnhBRLdwJJpa-phMBlKNA'},
                  
                ],
              },

              {
                'url':
                    'https://stat4.bollywoodhungama.in/wp-content/uploads/2024/03/Swatantrya-Veer-Savarkar-3.jpg',
                'title': 'Swatantra Veer Savarkar',
                'rating': '4.8',
                'detailImage': 'https://www.hindustantimes.com/ht-img/img/2024/03/26/1600x900/Savarkar_1653715564344_1711427818301.jpeg',
                'description': 'Swatantra Veer Savarkar is a biographical film about Vinayak Damodar Savarkar, a freedom fighter, writer, and leader in India’s struggle for independence. The movie traces his life, from his early years as a revolutionary to his imprisonment in the Andaman Cellular Jail. It highlights his ideas on Hindu nationalism, his opposition to British rule, and his contribution to the independence movement. The film also explores his controversial views on religion, politics, and his role in shaping India’s history. Through personal sacrifices, Savarkar emerges as a complex figure, deeply dedicated to India’s freedom and identity.',
                'cast': [
                  {'name': 'Randeep Hooda', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSh7727tCY8ZsTjIq0pyL21UANFWffvBk7FjIAmQi15vLQMkqk8_aoMSCqdi8jXHo9y0AJ-emoqfS_1qwb0pPZ9MsWKWcaryJUMuVd_Cok'},
                  {'name': 'Ankita Lokhande', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgfiQ8d_EttGEk6gRNi994OlRpbLMvT8FjOAgYRrAJRW4JfPSD'},
                  {'name': 'Amit Sial', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsr1L53YTniIgDDzCyutLk4-3uPMdk_-pDQYoixQJwS4ocj5GxppUe2VYPJxEubz6Mdsb14AF1QwGn87tgEfnhBRLdwJJpa-phMBlKNA'},
                  
                ],
              },
              {
                'url':
                    'https://m.media-amazon.com/images/M/MV5BNGY3ZTEzMTQtZjYzOS00ZmRhLWFlNzUtNjM4YzA4ZmQ1MzZhXkEyXkFqcGc@._V1_.jpg',
                'title': 'Dharmaveer II',
                'rating': '4.7',
                'detailImage': 'https://static.toiimg.com/thumb/msid-102563544,width-1280,height-720,resizemode-4/102563544.jpg',
                'description': 'Dharaveer 2 is a sequel to the 2021 film “Dharaveer,” which is a gripping action-thriller based in India. The story continues the journey of the protagonist, who faces new challenges and adversaries while seeking justice and truth. This installment delves deeper into themes of friendship, loyalty, and betrayal. As the main character navigates through dangerous situations, viewers are kept on the edge of their seats with thrilling twists and action-packed sequences. The film combines strong performances, captivating storytelling, and stunning visuals, making it an engaging watch for fans of the genre.',
                'cast': [
                  {'name': 'Prasad Oak', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR33Dl_ogIeSUHb5vDns__hqj5xQGPRyKU2yRRvJjnSRoN8AqnE'},
                  {'name': 'Kshitish Date', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSK-Q4vyWruGvQm_pGTkDFrV2Fdl2yNzG2gIJwTFsIQrYsgbGrr'},
                ],
              },
              
              {
                'url': 'https://www.tallengestore.com/cdn/shop/products/Padmaavat-DeepikaPadukone-BollywoodHindiMoviePosters_3915fe33-0053-43ba-a27e-76e6f1879b67.jpg?v=1625220948', 'title': 'Padmaavat', 'rating': '4.7', 'detailImage': 'https://iamsaahiil.weebly.com/uploads/8/9/2/5/89259322/padmavati-first-look-posters2_orig.jpg', 'description': 'Padmaavat is a historical drama set in medieval India, revolving around Queen Padmavati of Mewar. The beautiful and brave queen is married to Maharaja Ratan Singh. Their peaceful life is disrupted when Sultan Alauddin Khilji, obsessed with Padmavati’s beauty, invades Mewar. Despite Khilji’s attempts to capture her, Padmavati remains loyal to her husband. When Ratan Singh is killed in battle, and Khilji’s forces storm the palace, Padmavati and the women of Mewar commit jauhar (self-immolation) to avoid being captured. The film highlights themes of honor, sacrifice, and resistance against tyranny.', 'cast': [ {'name': 'Deepika Padukone', 'imageUrl': 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202102/deepika-padukone-ssr_1200x768.jpeg?size=690:388'}, {'name': 'Ranveer Singh', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSREbBzgmOG8xZHobWD46QzlvRCIMA2B7Lt5A&s'}, { 'name': 'Shahid Kapoor', 'imageUrl': 'https://blackhattalent.com/wp-content/uploads/2024/01/Shahid-Kapoor-1-3.jpg' }, { 'name': 'Aditi Rao Hydari', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTB7O4CnAsJO6fNph5LyZrh88zg1rv1v_WP52bOTKORTWOkdPzH' }, { 'name': 'Jim Sarbh', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ78TPNuiXX8JFFgiChcE15qAjkp602vmiGLg7FfdimwypoOYbH' }, { 'name': 'Anupriya Goenka', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRLoU4M0za2P6P3atzJSBT-5vtK3A50MIK1wE8gmhnq1rUcGG5E' }, ],
              },

              {
                'url':
                    'https://stat4.bollywoodhungama.in/wp-content/uploads/2024/08/Chhaava-02-306x393.jpg',
                'title': 'Chhaava',
                'rating': '4.9',
                'detailImage': 'https://i.ytimg.com/vi/OuZMoa1XC3c/maxresdefault.jpg',
                'description': 'Chhava is a historical film based on the life of Chhatrapati Sambhaji Maharaj, the eldest son of Chhatrapati Shivaji Maharaj. The movie focuses on Sambhaji’s journey as a brave warrior, leader, and ruler of the Maratha Empire after Shivaji’s death. It highlights his fierce resistance against the Mughal Empire and his unwavering dedication to protect his kingdom and Hindu culture. Despite facing betrayal and immense challenges, Sambhaji stands strong against Aurangzeb’s forces. The film portrays his courage, leadership, and ultimate sacrifice, showcasing him as a proud and valiant Maratha king who fought for his people’s freedom.',
                'cast': [
                  {'name': 'Vicky Kaushal', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd1RnXhU7m5iBDL4pHkWcnXE0mxCh9zF_kqt7JQZb2Fj4bhwt_'},
                  {'name': 'Akshaye Khanna', 'imageUrl': 'https://www.hindustantimes.com/ht-img/img/2024/03/28/550x309/_b29019e2-da0a-11e9-aefb-e5600836c7fe_1711604996728.jpg'},
                   {'name': 'Rashmika Mandanna', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQsP__nARp8kcie-_KFIBGzVrYrti-p4aLX3kKBhdC2n7IEMzFX'},
                   ],
              },

              {
                'url': 'https://m.media-amazon.com/images/M/MV5BODNkMTE3M2YtYjdkMi00ZDc3LWI3N2ItMDFkNTU5MjIyYzNhXkEyXkFqcGc@._V1_.jpg',
                 'title': 'Kho Gaye Hum Kahan',
                
                'rating': '4.5', 
                'detailImage': 'https://i.ytimg.com/vi/1FJ0sOehuGo/maxresdefault.jpg', 'description': 'Kho Gaye Hum Kahan is a story about three young friends living in Mumbai who are deeply connected through technology and social media. The film explores how their lives and friendships evolve in an era dominated by digital connections. As they navigate their personal aspirations, love, and relationships, they gradually realize the growing disconnect with themselves and each other in real life. The film reflects on how the digital world affects modern friendships and self-identity, leading the characters to question their true selves and seek meaning beyond the screen. It’s a journey of self-discovery and finding balance in a tech-driven world.', 
                'cast': [ {'name': 'Ananya Pandey', 'imageUrl': 'https://www.torani.in/cdn/shop/files/2_c1954c73-b514-413f-9d55-0caf83159882_800x.jpg?v=1683202100'}, {'name': 'Siddhant Chaturvedi', 'imageUrl': 'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202409/siddhant-chaturvedi-101942668-16x9.jpg?VersionId=BTSZkQ7oxZu2jEjn.YokF3d9Fei_xlRB&size=690:388'}, {'name': 'Adarsh Gourav', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQAlg_ZKGEqAlZZB3ewYAMYNRfJuKOmMu9xUCvm5eOAc3sgH0OaVbjJYbajaqGNIIJ4PVsKlPpIanjXrsrL9lVbtLuFoxhj812n-SwUYHwF6BoKho2RMNhbEbTyYtJqUeZV6hh-ir9J'}, ],
              },


            ],
          ),
          // Top Netflix Webseries
          const SizedBox(height: 20),
          _buildHorizontalScrollablePanel(
            context,
            title: 'Best of Netflix Webseries',
            movieImages: [
              {
                'url':
                    'https://m.media-amazon.com/images/M/MV5BNTk4ZDc4OTUtYmE3Mi00M2IzLWJhZWMtZTRmZTc2YzZkOGRmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
                'title': 'IC814',
                'rating': '4.1',
                'detailImage': 'https://www.livemint.com/lm-img/img/2024/09/09/600x338/814_1725866100622_1725866109592.png',
                'description': 'IC 814 is a gripping drama based on the real-life hijacking of Indian Airlines Flight IC 814 in December 1999. The film chronicles the harrowing ordeal of passengers and crew who are taken hostage by terrorists during a flight from Kathmandu to Delhi. As the situation escalates, the Indian government faces immense pressure to negotiate with the hijackers, who demand the release of their comrades in exchange for the safe return of the hostages. The narrative highlights the emotional struggles of the victims, the bravery of the security forces, and the complex political dynamics involved in handling such a crisis, ultimately showcasing the resilience of the human spirit in the face of terror.',
                'cast': [
                  {'name': 'Patralekha', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRZXkkFCKMANM0LrsrpYdhzVMX0zRgyeFOc4TZzNrVNougVmjTKfaLkL2WlQx4hx7gnlMY01QqZOW1gIIw'},
                  {'name': 'Vijay Verma', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS6TSCet5GcDVrSQ6v-UHDbFWjY7-lObWd5lVkkQfygjnY3cBgH'},
                  {'name': 'Arvind Swamy', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQic2MAKExiVZLLioA47g-taJxBpYcUY_yaS-2tGYA8A1-BXtZR'},
                ],
              },
              {
                'url':
                    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTZuoUSwTMdgYjIZglurAETKajn9xf-y4GJAv-mwktLXysJtMDxRxCG7_xwi6xAmhAnEUie',
                'title': 'Kota Factory',
                'rating': '4.3',
                'detailImage': 'https://i.ytimg.com/vi/aG8KWYko8VY/maxresdefault.jpg',
                'description': 'Kota Factory is a coming-of-age web series that revolves around the life of a teenager named Vaibhav who moves to Kota, a hub for students preparing for competitive exams like the IIT-JEE. The series portrays the struggles and challenges faced by Vaibhav and his friends as they navigate the pressures of intense academic competition, friendships, and personal growth. Set in a black-and-white aesthetic, it captures the essence of student life, highlighting the emotional and psychological toll of pursuing academic excellence while exploring themes of ambition, failure, and the importance of support systems. Through relatable characters and realistic storytelling, Kota Factory resonates with students and anyone who has faced similar challenges in their educational journey.',
                'cast': [
                  {'name': 'Jitendra Kumar', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAkPDtZinmy1dFLYVBEMPVlX1zcwOT3fyc02MnwXkc9efjLIk'},
                  {'name': 'Revathi Pillai', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS3kb7jyPJqf-iSu5fBIMN27A6xfQC-4UTg9O5f3eo34amCkd1n'},
                  {'name': 'Mayur More', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTZvdfC3Ackf1mH2qYf2GJ_PrZEBcrxdo5e7_kKT6m8yLdHHF-1'},
                ],
              },

              {
                'url':
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6s174ZNvixdwrsYb9Gf6eYiOk9_8udaUb54x7FdJxQ076JsIZjNdHXL_U5rpH80J2JsMG',
                'title': 'Kaala Paani',
                'rating': '4.5',
                'detailImage': 'https://i.ytimg.com/vi/6ph4WPZIrbM/maxresdefault.jpg',
                'description': 'Kala Paani is a gripping thriller series on Netflix that revolves around the mysterious and dangerous events surrounding a remote island in the Indian Ocean. The story follows a group of friends who travel to the island for a vacation but soon find themselves entangled in a web of supernatural occurrences and dark secrets. As they explore the island, they encounter bizarre phenomena and face psychological challenges that test their friendship and survival instincts. The series delves into themes of fear, trust, and the unknown, creating a suspenseful atmosphere as the characters unravel the island’s haunting history and confront their own inner demons. With its eerie setting and engaging storyline, Kala Paani captivates viewers by blending horror, mystery, and psychological elements.',
                'cast': [
                  {'name': 'Aarushi Sharma', 'imageUrl': 'https://images.news18.com/ibnlive/uploads/2022/07/arushi-sharma.jpg'},
                  {'name': 'Amey Wagh', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQI39_MlSmhNF00hBk2WYe3VWwHEKxiP_miHPUoLgZvRa_fK02b'},
                  {'name': 'Radhika Mehrotra', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWbml-AC2KgyKTlpQbdcENsFgGXuiFPONEGq8HfYANTX-nLG_8'},
            
                ],
              },
              {
                'url':
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQGZUVAOqKSKi1Ah6hZ58eRkBDxciDAmfPA8rNrnF6xkD5iB440nBH8DoiReHc2FqalupOy',
                'title': 'Squid Games',
                'rating': '4.6',
                'detailImage': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTAkyljpcpbDypQk9eASGNDyAeXmAO89tdf6eIxHun4_z4G9cSCiN_8miedk_ZdaUvIhdR0OfoQC101fd9YNcd8Eeq-gEg9DMzyZqQi-ks',
                'description': 'Squid Game is a South Korean survival drama series that follows a group of deeply indebted individuals who are invited to participate in a mysterious competition for a massive cash prize. Unbeknownst to them, the games they must play are children’s games with deadly stakes—losing means death. The protagonist, Seong Gi-hun, along with other contestants, navigates a series of harrowing challenges while forming alliances and facing betrayals. The series explores themes of desperation, morality, and the effects of capitalism, highlighting the lengths people will go to for survival. With its intense plot twists, emotional depth, and social commentary, Squid Game became a global phenomenon, captivating audiences worldwide.',
                'cast': [
                  {'name': 'Jung Ho-yeon', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQXPWcxMDxJPRznq0JqyB_V2lcqBPVe76eR1aPI1Wu47czMb2F0AQDOibs9xuFOpOtqf4ro5TO2c7YIAyI'},
                  {'name': 'Gong Yoo', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSMfJzTLkDgfVMZaWaYELPKgHqjqAlN2s2F9grdHssZ1UbgxzbO'},
                  {'name': 'Anupam Tripathi', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcR_qqEQzoUNTQeWCcsdXv-LhCZowy3FW6MwLc__Y0ljsEuNqsK8WiLjUGbXV7QnSg8Jhr14H1oTVrDPm8U'},
                ],
              },

              {
                'url':
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQE9DucFcAg9Lpp03RtsONbFrUEpJZlh7IZYyIk0gSstLEzxDUt',
                'title': 'The Sky is Pink',
                'rating': '4.2',
                'detailImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi39ny-NJFoJ9TBcUQpwWQljvAF7bcN3A0eg&s',
                'description': 'The Sky Is Pink is a heartfelt drama based on the true story of Aisha Chaudhary, a young woman who was diagnosed with pulmonary fibrosis. The film narrates her life journey, emphasizing the bond between Aisha and her parents, Niren and Aditi, as they navigate the challenges of her illness. Through a series of flashbacks, the story explores themes of love, loss, and resilience while highlighting the family’s efforts to maintain hope and happiness despite their struggles. Aisha’s unique perspective on life and death adds depth to the narrative, ultimately celebrating the beauty of relationships and the importance of cherishing every moment. The film combines emotional storytelling with poignant performances, making it a touching tribute to love and the human spirit.',
                'cast': [
                  {'name': 'Priyanka Chopra', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTxVb4B6r9RhcfJGyPhFGlE0QWOHvIQKP4W2zEhL2o56y7_vmKA'},
                  {'name': 'Farhan Akhtar', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSTXbibICG5mGrJqxH961ncFU95S9K_VWd5D8HsbeShGtcijTJl'},
                   {'name': 'Rohit Suresh Saraf', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSjKDylQWR97ZYWUlhJ5l0Gnp5LC9K8PLR5yX_WdMK9eVyvDL5i'},
                ],
              },

            ],
          ),

          //Hollywood Movies

        const SizedBox(height: 20),
          _buildHorizontalScrollablePanel(
            context,
            title: 'Top Hollywood Movies',
            movieImages: [
              {
                'url':
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY59I424U0u2l7NTPHGcUpPXav1171niuHUgOcUis6V0jBDOqY',
                'title': 'Deadpool & Wolverine',
                'rating': '4.5',
                'detailImage': 'https://sm.ign.com/t/ign_nordic/review/d/deadpool-w/deadpool-wolverine-review_j2mc.1280.jpg',
                'description': 'Deadpool and Wolverine share a unique bond due to their similar healing abilities, with Deadpool’s powers stemming from Wolverine’s DNA via the Weapon X program. Their relationship is a mix of rivalry and reluctant teamwork, as Wolverine’s serious demeanor often clashes with Deadpool’s chaotic, humorous personality. Despite their differences, they frequently team up to face common enemies, with their dynamic filled with violent clashes, witty banter, and mutual respect.',
                'cast': [
                  {'name': 'Leonardo DiCaprio', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTN-KprZey1Us6S8-E5Pg-Z-fAQXL5MliBG2-wXB05JyXD2qAmT'},
                  {'name': 'Hugh Jackman', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ4yArsFz1tENJ3-P4UE_lTTm8L7yDFvwq_oXmaF8WJ0be1pOlZ'},
                ],
              },
              {
                'url':
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQWPh6PeuTgtO_Zzmap6eXJrwBro7Rpz-VOBSqo_7j1-CW9rmEhD0fGArmbXSoWphgcr4ml',
                'title': 'Stranger things',
                'rating': '4.8',
                'detailImage': 'https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png',
                'description': 'Stranger Things follows a group of kids in the 1980s town of Hawkins, Indiana, as they search for their missing friend, Will Byers, who has been taken to a dark parallel dimension called the Upside Down. Along the way, they meet Eleven, a girl with supernatural powers who escaped from a secret lab. Together, they face dangerous creatures like the Demogorgon and uncover government conspiracies, all while dealing with the emotional struggles of growing up. The show blends sci-fi, horror, and nostalgic 80s vibes as the group fights to protect their town from the Upside Down’s increasing threats.',
                'cast': [
                  {'name': 'Millie Bobby Brown', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSTtOkWwz9CcuhdS8KsMZkXs3ktALIHf2gYGrj89xoRwHuTATMA2eUJh6UlQr1G15qnBnDZJgsbcaf6Y-GHfi5V8FFzi1SCxZbGmevcUxM'},
                  {'name': 'Finn Wolfhard', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTFzfkQDd7sikpEaO7ZQtfU3raT6HSCuA1NSLM2GbOOObd71ND77hWsgb6JS3EEkdSAYQHJE4iXFxCTICtoIdBsDrLcJzVP6GJIGIy4Wdho5dbREW0U9ZEMMa1D2Fdt6r6b8v9m7DZS'},
                   {'name': 'Noah Schnapp', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRFHHqQ6A5mzQ7w_505ZE8ixp5rhEE2FlaxDJ54XlqeNUKHxLzD'},
                ],
              },

              {
                'url':
                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSiUmIcVrkPYQp3DlxLm-A6dtEHCaBEh4vpTEird1xFTkCwOb2FGMcjo-ZXsg7kF7HTxqta',
                'title': '13 Reasons Why',

                'rating': '4.3',
                'detailImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5YgXitxlgsSNS3exrvlNsszXIEZNyO4tExg&s',
                'description': '13 Reasons Why follows the story of a high school student, Clay Jensen, who receives a set of cassette tapes recorded by his classmate, Hannah Baker, after she takes her own life. On the tapes, Hannah explains the 13 reasons—or people—who contributed to her decision to end her life, exposing bullying, betrayal, and toxic behavior within the school. As Clay listens to the tapes, he uncovers painful secrets about his classmates and himself, grappling with guilt, regret, and the impact of his actions. The series explores heavy themes like mental health, suicide, bullying, and the consequences of actions in the lives of teenagers.',
                'cast': [
                  {'name': 'Dylan Minnette', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiFdV1Nv0KA6sJGvneZpvMkE9_8BMzepOEXg&s'},
                  {'name': 'Alisha Boe', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQcflB3IqyYLKtkkSMGG-Wa-ks-78otBqwoQ7EM60n-myKNCb7Y8J4Fd9Cl6jZA8yZB_sF9oDZmcit9P44'},
                ],
              },

              {
                'url':
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZv8ncasz1YDjpLzKfiaTM2bQHFz9zBDXs6g&s',
                'title': 'Fast and furious',
                'rating': '4.7',
                'detailImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrlPGzufnkV6MSvAzzSBeVG-VByjh1nzZ3Eg&s',
                'description': 'Fast & Furious X (Fast X) is the tenth installment in the Fast & Furious franchise, where Dominic Toretto and his crew confront a new enemy, Dante Reyes, the vengeful son of the drug lord Hernan Reyes from Fast Five. As Dante seeks to destroy Dom’s family, the crew embarks on a globe-trotting mission filled with high-speed car chases, intense stunts, and daring heists. With familiar faces like Letty, Roman, and Tej, along with new allies and adversaries, the film deepens its themes of family loyalty while setting up an explosive showdown that leads toward the saga’s final chapter.',
                'cast': [
                  {'name': 'Vin Diesel', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQnTHugIimJ8NX9Aiz3T6wQKxM-ND-FmK9rB4V5LaqjM1JZYMM1'},
                  {'name': 'Alan Ritchson', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQVPJq2IA1XyRCnCr37kVYTDsoItKMRnc_oU_IqryF2o3VtjVVP'},
                  {'name': 'Michelle Rodriguez', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQIHfQjdZflgqOEIJ8hrf2QC2ea8bjD7z1AQrlYF4jnqKbzB16Uq7Zal3Ude0xy0JMoRcTGp5xDKkqNwe7pud21On88BjjFr17c2E65w8YT7embPGIEt43XflqYXYdSfsprJnuUDZGGyQ'},
                ],
              },

              {
                'url':
                    'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR0wzGU--2HF9DWyYaYAgQVoaSMsheMFprqt4f42nSYyUmdf-HLWyZxvs5x5rvApj5zxSMnqFVuoGSh4XD056I72FmOF2XfJXaPME_csQ',
                'title': 'The Walking Dead',
                'rating': '4.9',
                'detailImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzLfO8SPBNwKQuzAyfxXWSLEqxsr680lptaAcSrmY1DXgclFwXGLhOIfbIUYqmMs9rrF9maQ9KvuoUiyqbamL3oV8Q80UQU1ZmDrKzwg',
                'description': 'The Walking Dead is a post-apocalyptic series that follows a group of survivors struggling to stay alive in a world overrun by zombies, known as “walkers.” Led initially by sheriff Rick Grimes, the group faces not only the constant threat of the undead but also other human survivors who often prove to be just as dangerous. As they search for safety, the survivors must adapt to a new way of life, build communities, and face tough moral choices. The series explores themes of survival, humanity, and leadership in a world where society has collapsed.',
                'cast': [
                  {'name': 'Norman Reedus', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcRk-PWuwo9x9sUsAvzeWXw8J6cENen5ntHoYnC5kAgMarf6PemolGmpVD_zGvgkIuEvelRttA4Mn7_bZe_QgGgAOUgmJwYw8n6UIFiok33skCe_ss_EhRr4yfM2IMMrxLanyvnNvVp_'},
                  {'name': 'Andrew Lincoln', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTVuZ3Z_3DP0cHrxRYB6usmNKH9zCF1E_QzCSF7hrP-yKgdvc7W'},
                  {'name': 'Lauren Cohan', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzISeyeFyAXc4iAx83nDYft3YFgo58r7aL2jm-4MaOovLAfMHl'},
                ],
              },

            ],
          ),
           
          // South Indian Movies
          const SizedBox(height: 20),
          _buildHorizontalScrollablePanel(
            context,
            title: 'South Indian Movies',
            movieImages: [
              {
                'url':
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSs5Vo2OulSEXWfroqvIjx0VvYqYjVGLaUHUsfHV7laaYxIQ7qFvkQGD_eao-dt0eIM-JJHag',
                'title': 'K.G.F: Chapter 2',
                'rating': '4.9',
                'detailImage': 'https://www.hiravshah.com/wp-content/uploads/2022/04/kgf-chapter-2.jpg',
                'description': 'KGF Chapter 2 continues the story of Rocky, who rises to power as the king of the Kolar Gold Fields (KGF) after defeating Garuda in the first film. In this chapter, Rocky faces new enemies who want to overthrow him, including Adheera, a ruthless warrior, and political forces that see him as a threat. As he consolidates his rule over KGF, Rocky battles internal and external challenges while staying loyal to his people. The film is filled with intense action, grand visuals, and the exploration of Rocky’s ambition, power, and legacy as he fights to retain control of KGF.',
                'cast': [
                  {'name': 'Yash', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRm4rRdVGzXPI13SG0zseDDKMtXrcSM8UnfhDLBBU0gWhKvhj8GUAQSWI1GQpf-tvaOf7TdPbn7P-cyEu8U7_CNNkGeHJZSCYyabJaYNdM'},
                  {'name': 'Srinidhi Shetty', 'imageUrl': 'https://pbs.twimg.com/profile_images/1734984845053546498/0-HRvl14_400x400.jpg'},
                   {'name': 'Sanjay Dutt', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRPljgCDTzsso5FqzTGXuv0RfvTJ4WmLSHK1_3UN0yKvcciSjC1'},
                ],
              },
              {
                'url':
                  'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS3I84wCRTf0lEnJBcXKdTnHGsKUUtptPZOKjar3x9F97SbbdInBh6oQ6j9eFo6c361C5iM',
                'title': 'Pushpa: The Rise',
                'rating': '4.7',
                'detailImage': 'https://thesamikhsya.com/wp-content/uploads/2023/08/Puspa.jpg',
                'description': 'Pushpa: The Rise follows the story of Pushpa Raj, a fearless laborer who rises through the ranks of a red sandalwood smuggling syndicate in the forests of Andhra Pradesh. Despite starting from humble beginnings, Pushpa’s ambition, cunning, and boldness help him gain power in the illegal trade. However, his growing influence attracts the attention of powerful enemies, including the corrupt police and rival smugglers. The film showcases Pushpa’s journey as he defies authority, fights for respect, and claims his place in the criminal underworld, with intense action and rugged charisma.',
                'cast': [
                  {'name': 'Allu Arjun', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSdbWBDhKXLIki16Xk8qBDfCggu2xyA0isrnvbRRB2Ek10o-10g'},
                  {'name': 'Rashmika Mandanna', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQsP__nARp8kcie-_KFIBGzVrYrti-p4aLX3kKBhdC2n7IEMzFX'},
                  {'name': 'Sunil', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQTaYcPmV6tDrJTNPusCE3y6SckFSLUjOxRT-WZwRXSirLXxGHj'},
                ],
              },

              {
                'url':
                  'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSwAZddfdsmgj84MRQyRDfNxl-swkZRxt2IQX3gnLkzHl3EEzyD3dduWibKdNCCqOTyaL3WIw',
                'title': 'Bahubali 2',
                'rating': '4.9',
                'detailImage': 'https://img10.hotstar.com/image/upload/f_auto/sources/r1/cms/prod/8819/1418819-i-966770c33cef',
                'description': 'Baahubali 2: The Conclusion reveals the epic saga of Mahendra Baahubali as he learns about the betrayal and murder of his father, Amarendra Baahubali, by his uncle, Bhallaladeva. The film delves into the past, showing Amarendra’s rise as the beloved ruler of Mahishmati and his love for Devasena. After Bhallaladeva’s treachery leads to Amarendra’s death, Mahendra seeks to avenge his father and reclaim the throne. With grand battle sequences, stunning visuals, and the theme of loyalty and justice, Mahendra Baahubali fights to restore honor to his family and bring peace to the kingdom.',
                'cast': [
                  {'name': 'Prabhas', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ6Frl0HX2o_waVrKdR6xS2c1hok4JNM2pSumCIVm-zxikxeSh0'},
                  {'name': 'Anushka Shetty', 'imageUrl': 'https://static.toiimg.com/thumb/msid-112546661,width-400,resizemode-4/112546661.jpg'},
                  {'name': 'Rana Daggubati', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpXEt-WBD7NaD54NjKYnoINPMVcJ5VgT1stO6mNdxrnTt34yEL'},
                ],
              },

              {
                'url':
                  'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ_gA25hvAzvrTHQaotqRuOVJqQbWScm5Ig5dF4ctHmnF5bUjPpUFqKTHZRqrm8CwG-98ILbA',
                'title': 'RRR',
                'rating': '4.6',
                'detailImage': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ2B-k6h04rNtyUJM0mDidT1VxPrj_oprGoiqhAt6hcGfM6r5B_f5i9xEZpRFQ90Yvh-HzBdIDEt7g91Qfro8E3QaUF3_3K3EKfOPdnSyU',
                'description': 'RRR is a historical action drama set in the 1920s that follows the fictionalized story of two Indian revolutionaries, Alluri Sitarama Raju and Komaram Bheem, who fight against British colonial rule. The film showcases their friendship, bravery, and determination as they unite to battle the oppressive regime. Raju, an undercover police officer, is tasked with capturing Bheem, who seeks to rescue a young girl from British captors. As their paths cross, they join forces to take on their common enemy. With breathtaking action sequences, powerful performances, and a strong emphasis on patriotism, RRR celebrates the spirit of resistance and friendship in the fight for freedom.',
                'cast': [
                  {'name': 'Ram Charan', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbmVs7AiwFtoQlBQF2rYwg18ezt6IcvOviVEssju-Iez2zcFVy'},
                  {'name': 'N. T. Rama Rao Jr', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcS7MIX1qXmKhvROh0M7FKxRHm3Deirla_ZV1Hw0GtPQQ7DBIAloQQrQzFXiNtoCOE-_RzreDYhGaLrVdik'},
                  {'name': 'Alia Bhatt', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR91nmOF1TxYlWStKz4pltUyokUgeBP3xMBKiecXadQZk9e4KUC'},
                ],
              },

              {
                'url':
                  'https://upload.wikimedia.org/wikipedia/en/c/cb/Jailer_2023_Tamil_film_poster.jpg',
                
                'title': 'Jailer',
                'rating': '4.4',
                'detailImage': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0QP831-Mhp1z3SvMwB3TSp8u-OkFdc8zZbQ&s',
                'description': 'Jailer follows the story of Muthuraj, a retired police officer and a strict jailer whose life takes a dramatic turn when his son, a police officer, goes missing while investigating a high-profile case involving a dangerous criminal organization. As Muthuraj delves into the underworld to uncover the truth, he faces moral dilemmas and confronts his past. With intense action sequences and emotional depth, the film explores themes of justice, family loyalty, and the fight against corruption. Muthuraj must navigate a world filled with treachery and violence, ultimately leading him to take matters into his own hands to protect his loved ones and restore order.',
                'cast': [
                  {'name': 'Rajinikant', 'imageUrl': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQTKaQdfSlsnwCj19dAuTliyI-LAp2ZqtHnyE2c_v80lqC7EI5D'},
                  {'name': 'Mirna Menon', 'imageUrl': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSPq3urIJLZt9Hl9RxkycvK2qJznt8SecnhJulBYSTWQ3UNaHmAgvkfnjjZOvzBLUYdwQssKAO2M71n2-t4YFvKmGjSz0nJA9HdonWQxA'},
                   {'name': 'Vinayakan', 'imageUrl': 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ23S02HR-VGOjJaYCj802YjIL8Uodpf9dgUiftbP1s2NEsxoPA'},
                ],
              },
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildFeaturedMoviePanel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trending',
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MovieDetailScreen(
                  title: 'Taaza Khabar S2',
                  imageUrl: 'https://i.ytimg.com/vi/cEukRxuyEUg/maxresdefault.jpg',
                  description: 'Details about the featured movie will be displayed here.',
                  cast: [
                    {'name': 'Bhuvan Bam', 'imageUrl': 'https://via.placeholder.com/100'},
                    {'name': 'Shivangi Dubey', 'imageUrl': 'https://via.placeholder.com/100'},
                  ],
                  rating: '4.5',
                ),
              ),
            );
          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage('https://i.ytimg.com/vi/RqBwaiN8Lok/maxresdefault.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalScrollablePanel(
    BuildContext context, {
    required String title,
    required List<Map<String, dynamic>> movieImages,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View All', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieImages.length,
            itemBuilder: (context, index) {
              final movie = movieImages[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(
                        title: movie['title']!,
                        imageUrl: movie['detailImage']!,
                        description: movie['description']!,
                        cast: movie['cast']!,
                        rating: movie['rating']!,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 140,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(movie['url']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie['title']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final List<Map<String, String>> cast;
  final String rating;

  const MovieDetailScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.cast,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl, height: 350, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    'Rating: $rating',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cast:',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildCastSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCastSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cast.map((actor) {
        return Padding(
         padding:const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(actor['imageUrl']!),
              ),
              const SizedBox(height: 5),
              Text(
                actor['name']!,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}