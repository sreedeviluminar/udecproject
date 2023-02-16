import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: StatusScreen(),));
}
class StatusScreen extends StatelessWidget {
  List Recentview = [
    {
      'dp':
      'https://www.filmibeat.com/img/2019/02/kerala-state-film-awards-best-actors-2-1551245856.jpg',
      'title': 'Mammookka',
      'sub': 'just now',
    },
    {
      'dp': 'https://static.toiimg.com/photo/78766905.cms?imgsize=367804',
      'title': 'Prithviraj Sukumaran',
      'sub': '50 Minute ago',
    },
    {
      'dp':
      'https://th.bing.com/th/id/OIP.Hl1u_ZFNgChMXcGlttBPlgHaFj?pid=ImgDet&rs=1',
      'title': 'Sundar Pichai',
      'sub': "30 Minute ago",
    },
  ];
  List viewdview = [
    {
      'dp':
      'https://th.bing.com/th/id/OIP.bYYPVYG9irJsLEN5FJb2mQHaGx?pid=ImgDet&rs=1',
      'title': 'Air Chief Rakesh Kumar Singh',
      'sub': '50 Minute ago',
    },
    {
      'dp': 'https://i.insider.com/59f8dc483e9d25db458b5dfc?width=2400',
      'title': 'Elon Musk',
      'sub': "1 hour ago",
    },
    {
      'dp':
      'https://th.bing.com/th/id/OIP.AKORIRJpEBG-C3ISO3RmOgHaJQ?pid=ImgDet&rs=1',
      'title': 'Kiran Das IPS',
      'sub': "2 hour",
    },
    {
      'dp':
      'https://www.chitramala.in/wp-content/uploads/2014/11/kamal-hassan-birthday-2014.jpg',
      'title': 'Kamal Hasan',
      'sub': "Yesterday",
    },
    {
      'dp':
      'https://1.bp.blogspot.com/-o9hAWjBzaJI/Xg-XKAcGQII/AAAAAAAAAGs/IG-ZtmyYNx4ZZxfGCkxFUkB7YvEhcDGGgCLcBGAsYHQ/s1600/Can%2BYaman%2B2.jpg',
      'title': 'Shihab K Saleem',
      'sub': '1 day ago',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/R.26b4d77edba3719089bd61010708cbf6?rik=cGj9%2bmjk%2b5NKHg&riu=http%3a%2f%2fcyberbargins.net%2favatar2.jpg&ehk=wVOsFvG53JSGWsU5iysfeNG696r0nSetxIZRIYOWHa0%3d&risl=&pid=ImgRaw&r=0'),
                        radius: 27,
                      ),
                    ),
                    const Positioned(
                      right: 3,
                      bottom: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 10,
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                title: const Text(
                  'My Status',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text('Tap to add status Update'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: double.infinity,
              color: const Color.fromARGB(255, 227, 226, 226),
              child: const Padding(
                padding: EdgeInsets.only(top: 8, left: 15),
                child: Text(
                  'Recent Updates',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Recentview.length,
              separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(Recentview[index]['dp']),
                  ),
                  title: Text(
                    Recentview[index]['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    Recentview[index]['sub'],
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: double.infinity,
              color: const Color.fromARGB(255, 227, 226, 226),
              child: const Padding(
                padding: EdgeInsets.only(top: 8, left: 15),
                child: Text(
                  'Viewed Updates',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Recentview.length,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(viewdview[index]['dp']),
                  ),
                  title: Text(
                    viewdview[index]['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    Recentview[index]['sub'],
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.camera_alt_outlined),
        backgroundColor: const Color.fromARGB(255, 53, 124, 56),
      ),
    );
  }
}
