import 'package:flutter/material.dart';
import 'package:pembukuan_apps/utils/design_system.dart';
// import 'widget/custom_button.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'list_products.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _notificationCount = 3; // Jumlah notifikasi (contoh: 3 notifikasi baru)
  bool _isExpanded = false;

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
    setState(() {
      _isExpanded =
          !_isExpanded; // Toggles the visibility of the additional buttons
    });
  }

  String dropdownValue = 'Hari ini';
  List<String> dateOptions = [
    'Hari ini',
    'Kemarin',
    'Mingguan',
    'Bulanan',
    'Tahunan'
  ];

  @override
  Widget build(BuildContext context) {
    int totalProducts = products.length;

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Text('Products',
            //         style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //             color: DesignSystem.whiteColor)),
            //     CustomButton(
            //       iconData: Icons.add,
            //       onPressed: _onButtonPressed,
            //       text: 'Add Product',
            //     ),
            //   ],
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(47, 158, 158, 158),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color.fromARGB(84, 158, 158, 158),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products Stats',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: DesignSystem.whiteColor),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 40,
                        decoration: BoxDecoration(
                          color: DesignSystem.blackColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            // icon date
                            Icon(Icons.calendar_month_outlined,
                                color: Colors.white),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: dropdownValue,
                              items: dateOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue =
                                      newValue!; // Perbarui nilai dropdownValue saat terjadi perubahan dropdown
                                });
                              },
                              underline: Container(),
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Colors.grey[800],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: DesignSystem.purpleAccent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Saldo',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. 0',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman ProductList saat widget ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductList(products: products),  
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: DesignSystem.orangeAccent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Produk',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: DesignSystem.whiteColor,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '$totalProducts Produk',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: DesignSystem.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(102, 158, 158, 158),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pengeluaran',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. 0',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: DesignSystem.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pemasukan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Rp. 0',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: DesignSystem.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: SpeedDial(
        // Both default and active icon can be set separately
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // This is ignored if animatedIcon is non-null
        icon: Icons.add,
        activeIcon: Icons.close,
        buttonSize: Size(56.0, 56.0),
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('Opening dial'),
        onClose: () => print('Dial closed'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            // backgroundColor: DesignSystem.whiteColor,
            label: 'Tambah Produk',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {},
            shape: CircleBorder(),
          ),
          SpeedDialChild(
            child: Icon(Icons.arrow_downward_outlined),
            backgroundColor: DesignSystem.whiteColor,
            label: 'Pemasukan',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('Second action'),
            shape: CircleBorder(),
          ),
          SpeedDialChild(
            child: Icon(Icons.arrow_upward_outlined),
            backgroundColor: DesignSystem.whiteColor,
            label: 'Pengeluaran',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('Second action'),
            shape: CircleBorder(),
          ),
          // Add more SpeedDialChild widgets for additional actions
        ],
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
