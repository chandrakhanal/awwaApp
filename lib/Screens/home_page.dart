import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'web_view.dart';

class HomePage extends StatelessWidget {
  final String title = "Welcome to My AWWA";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/AWWALogo.min.png'),
        title: Text(title),
        backgroundColor: Colors.pink[100],
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asha-light.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Register Yourself in',
                style: TextStyle(
                    fontSize: 22,
                    backgroundColor: Colors.pinkAccent,
                    color: Colors.white),
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Guidelines'),
                      content: const Text(
                          '1. The business should be a source of Goods or Services.\n2. Applicant should be the founder of the business.\n3. The business should be running successfully for a minimum period of 6 months.\n4. Applicant should have invested in the business.\n5. Business should preferably be generating employment.\n6. Register with all relevant details and attach document (presentation/PDF only).'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const AwwaWebPage(
                                        title: 'Entrepreneur Registration',
                                        url:
                                            'https://awwa.org.in/entrepreneur/register'),
                              ));
                            },
                            child: const Text('Ok'))
                      ],
                    ),
                  );
                },
                inputText: 'Entrepreneur',
                height: 60.00,
                bIcon: const Icon(
                  Icons.portrait_rounded,
                  color: Colors.white,
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AwwaWebPage(
                        title: 'Expert Registration',
                        url: 'https://awwa.org.in/expert/register'),
                  ));
                },
                inputText: 'Experts',
                height: 60.00,
                bIcon: const Icon(
                  Icons.table_chart,
                  color: Colors.white,
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AwwaWebPage(
                        title: 'Talent Blog',
                        url: 'https://awwa.org.in/writer/registration/'),
                  ));
                },
                inputText: 'Talent Blog',
                height: 60.00,
                bIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AwwaWebPage(
                        title: 'ArtTrack',
                        url: 'https://awwa.org.in/expert/register'),
                  ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const EntrepreneurRoute()),
                  // );
                },
                inputText: 'ArtTrack',
                height: 60.00,
                bIcon: const Icon(
                  Icons.brush_rounded,
                  color: Colors.white,
                ),
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                          'GUIDELINES FOR CONTRIBUTION TOWARDS VIDEO GALLERY'),
                      content: const Text(
                          '1. The business should be a source of Goods or Services.\n2. Applicant should be the founder of the business.\n3. The business should be running successfully for a minimum period of 6 months.\n4. Applicant should have invested in the business.\n5. Business should preferably be generating employment.\n6. Register with all relevant details and attach document (presentation/PDF only).'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const AwwaWebPage(
                                        title: 'Video & Photo',
                                        url:
                                            'https://awwa.org.in/entrepreneur/register'),
                              ));
                            },
                            child: const Text('Ok'))
                      ],
                    ),
                  );
                },
                inputText: 'Video & Photo',
                height: 60.00,
                bIcon: const Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 48,
                child: Image.asset(
                  'assets/images/AWWA Logo 2.jpg',
                ),
              ),
              const Text(
                'We care and We share and Together We grow into \n a Strong Community',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      // drawer: Drawer(),
      /* floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.pink[400]),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),*/
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AWWA APP"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {},
        child: Text("Entrepreneur"),
      )
          // child: Icon(
          //   Icons.airport_shuttle,
          //   color: Colors.pink,
          // ),
          ),
      drawer: Drawer(),
    );
  }*/
}
