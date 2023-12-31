import 'package:flutter/material.dart';
import 'package:pembukuan_apps/utils/design_system.dart';
import 'widget/custom_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _notificationCount = 3; // Jumlah notifikasi (contoh: 3 notifikasi baru)

  void _navigateToProfile() {
    // Aksi navigasi ke halaman profile
    // Tambahkan logika navigasi di sini
  }

  void _showNotifications() {
    // Aksi untuk menampilkan daftar notifikasi atau navigasi ke halaman notifikasi
    // Tambahkan logika tampilan notifikasi di sini
  }

  void _onButtonPressed() {
    // Aksi yang akan dijalankan ketika tombol ditekan
    print('Button Pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.grey[850],
            height: 1,
          ),
        ),
        actions: <Widget>[
          NotificationButton(
            onPressed: _showNotifications,
            notificationCount: _notificationCount,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: _navigateToProfile,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/profile_image.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Products',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.whiteColor)),
                CustomButton(
                  iconData: Icons.add,
                  onPressed: _onButtonPressed,
                  text: 'Add Product',
                ),
              ],
            ),
            SizedBox(height: 20), // Spasi antara tombol dan konten lainnya
            SizedBox(
              child: Container(
                height: 300,
                color: const Color.fromARGB(94, 158, 158, 158),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      'Other Content',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Other Content',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int notificationCount;

  const NotificationButton({
    Key? key,
    required this.onPressed,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DesignSystem.greyColor.withOpacity(0.5),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: DesignSystem.whiteColor,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: NotificationCount(count: notificationCount),
        ),
      ],
    );
  }
}

class NotificationCount extends StatelessWidget {
  final int count;

  const NotificationCount({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6),
      ),
      constraints: BoxConstraints(
        minWidth: 14,
        minHeight: 14,
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
