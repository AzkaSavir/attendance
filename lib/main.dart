import 'package:attendance/ui/absent/absent.dart';
import 'package:attendance/ui/attendance/attendance.dart';
import 'package:attendance/ui/history/attendancehistory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // disable the back button
      onPopInvoked: (bool didPop) async {
        if (!didPop) {
          final shouldPop = await _onWillPop(context);
          if (shouldPop) {
            Navigator.of(context).pop(true);
          }
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.indigo[800]!,
                Colors.indigo[800]!,
              ])),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Mate',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[100],
                      height: 1.3),
                ),
                Text(
                  'what you want to do?',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[100],
                      height: 1.3),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    _buildMenuCard(
                        icon: Icons.camera,
                        color: Colors.amberAccent,
                        title: 'Attendance',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) =>
                                      const AttendanceScreen()));
                        }),
                    _buildMenuCard(
                        icon: Icons.beach_access_rounded,
                        color: Colors.blue,
                        title: 'Leave',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) => const AbsentScreen()));
                        }),
                    _buildMenuCard(
                        icon: Icons.history_edu_rounded,
                        color: Colors.purple,
                        title: 'History',
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) =>
                                      const AttendanceHistoryScreen()));
                        }),
                    _buildMenuCard(
                        icon: Icons.logout,
                        color: Colors.redAccent,
                        title: 'Exit',
                        onTap: () async {
                          final shouldPop = await _onWillPop(context);
                          if (shouldPop) {
                            Navigator.of(context).pop(true);
                          }
                        }),
                  ],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }

  @override
  Widget _buildMenuCard({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 6,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.shade800,
                ),
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Comfrim Exit'),
              content: Text('Are you sure you want to Exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('no'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ));
  }
}
