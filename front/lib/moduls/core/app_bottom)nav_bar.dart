import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vrouter/vrouter.dart';

class AppBottomNavbar extends StatelessWidget {
  const AppBottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: getCurrentIndex(context),
      onTap: (value) {
        switch (value) {
          case 0:
            context.vRouter.to('/lone');
            break;
          case 1:
            context.vRouter.to('/');
            break;
          case 2:
            context.vRouter.to('/common_goal');
            break;
          /*    case 3:
            context.vRouter.to('/');
            break;  */
          default:
            context.vRouter.to('/');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/profile.svg',
            color: (getCurrentIndex(context) == 0) ? Color(0xff394867) : null,
          ),
          label: 'درخواست وام',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/home.svg',
            color: (getCurrentIndex(context) == 1) ? Color(0xff394867) : null,
          ),
          label: 'خانه',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/common_goal.svg',
            width: 30,
            color: (getCurrentIndex(context) == 2) ? Color(0xff394867) : null,
          ),
          label: 'هدف جمعی',
        ),
        /*    BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/wallet_light.svg',
            color: (getCurrentIndex(context) == 2) ? Color(0xff394867) : null,
          ),
          label: 'کیف پول',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/home_light.svg',
            color: (getCurrentIndex(context) == 3) ? Color(0xff394867) : null,
          ),
          label: 'خانه',
        ), */
      ],
      selectedLabelStyle: TextStyle(fontSize: 10),
      selectedItemColor: Color(0xff394867),
      unselectedItemColor: Colors.red,
      showUnselectedLabels: false,
    );
  }

  int getCurrentIndex(BuildContext context) {
    if (context.vRouter.path.contains('home')) {
      return 0;
    } else if (context.vRouter.path.contains('lone')) {
      return 1;
    } else if (context.vRouter.path.contains('common_goal')) {
      return 2;
    } /*  else if (context.vRouter.path.contains('chat')) {
      return 0;
    } */
    return 0;
  }
}
