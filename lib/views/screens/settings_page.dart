import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          //alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.amber,
               height: 200,
            //   decoration: const BoxDecoration(
            //       color: Colors.amber,
            //       borderRadius: BorderRadius.all(Radius.circular(10))),
             ),
            const Positioned(
              top: 150,
              left: 10,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Antor Chakraborty',style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.person),
          onTap: () {

          },
          title: const Text('Your Profile',style: TextStyle(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(thickness: 1,indent: 50,endIndent: 30),
        ListTile(
          leading: const Icon(Icons.post_add),
          onTap: () {
          },
          style: ListTileStyle.list,
          title: const Text('Your Posts',style: TextStyle(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(thickness: 1,indent: 50,endIndent: 30),
        ListTile(
          leading: const Icon(Icons.edit),
          onTap: () {
          },
          title: const Text('Edit Prayer Notification',style: TextStyle(fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const Divider(thickness: 1,indent: 50,endIndent: 30),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language',style: TextStyle(fontSize: 18)),
          trailing: ToggleButtons(
            selectedColor: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            children: const [
              Text('EN'),
              Text('BN')
            ],
            isSelected: const [
              false,
              true,
            ],
          ),
        ),
        //const Divider(thickness: 1,indent: 50,endIndent: 30),
        ListTile(
            leading: const Icon(Icons.dark_mode),
          title: const Text('Theme',style: TextStyle(fontSize: 18)),
          trailing: Switch(
            value: false,
            onChanged: (value) {

            },
            activeColor: Colors.blue,
          )
        ),
        const Divider(thickness: 1,indent: 50,endIndent: 30),
        ListTile(
            leading: const Icon(Icons.logout),
          onTap: () {
          },
          title: const Text('Log Out',style: TextStyle(fontSize: 18))
        ),

      ],
    );
  }
}
