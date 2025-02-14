import 'package:eloro_shop_uae/core/constants/app_constants.dart';
import 'package:eloro_shop_uae/core/constants/app_images.dart';
import 'package:eloro_shop_uae/core/func/nav_func.dart';
import 'package:eloro_shop_uae/core/themes/app_colors.dart';
import 'package:eloro_shop_uae/view/shared/screens/under_deve_screen.dart';
import 'package:eloro_shop_uae/view/shared/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // context.read<PersonalProfileBloc>().add(GetPersonalProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black, // Your desired app bar color

      appBar: AppBar(
        backgroundColor: AppColors.mainColor, // Your desired app bar color
        elevation: 0, // Remove shadow if desired
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
              ),
            );
          },
        ),

        centerTitle: true,
        title: Image.asset(AppImages.logoDarkAll),

        actions: [
          IconButton(
            onPressed: () {
              // navigateTo(context, UnderDevScreen());
              // this edit to be accepted in apple store
              customAppToast(
                  message:
                      // "${AppLocalizations.of(context)!.signInWelcome}: ${context.read<AuthBloc>().cashedArabicUserName != null ? context.read<AuthBloc>().cashedArabicUserName! : " "}");
                      // AppLocalizations.of(context)!.underDev 
                      "tesssssst"
                      );
            },
            icon: Icon(
              Icons.notifications_on_rounded,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
          ),
          IconButton(
            onPressed: () {
              navigateTo(context, const UnderDevScreen());
            },
            icon: Icon(
              Icons.settings_rounded,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            ),
          ),
        ],
      ),
      // drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container( 
height: 200 , 
width: 200 ,
 color: AppColors.mainColor ,

          ), 
        ),
      ),
    );
  }
}

class _CompanyListTile extends StatelessWidget {
  final String? companyNameAr;
  final String? companyNameEn;
  final String? logoUrl;
  final int? notificationCount;
  final bool? isActive; // Determines the visibility of trailing

  const _CompanyListTile({
    super.key,
    required this.companyNameAr,
    required this.companyNameEn,
    required this.logoUrl,
    required this.notificationCount,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the localized company name based on the locale
    final locale = Localizations.localeOf(context).languageCode;
    final companyName = locale == 'ar' ? companyNameAr : companyNameEn;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 2),
            image: logoUrl != null
                ? DecorationImage(
                    image: NetworkImage(logoUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: logoUrl == null
              ? const Icon(Icons.image_not_supported, color: Colors.grey)
              : null,
        ),
        title: Text(
          companyName ?? "N/A", // Fallback to "N/A" if name is null
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
        subtitle: Text(
          "Notifications: ${notificationCount ?? 0}", // Fallback to 0 if null
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 13,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyMedium!.color,
              ),
        ),
        trailing: isActive == true
            ? Container(
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            : null, // No trailing widget if isActive is false
      ),
    );
  }
}

// class _CompanyListTile extends StatelessWidget {
//   final String? companyNameAr;
//   final String? companyNameEn;
//   final String? logoUrl;
//   final int? notificationCount;
//   const _CompanyListTile({
//     super.key,
//     required this.companyNameAr,
//     required this.companyNameEn,
//     required this.logoUrl,
//     required this.notificationCount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).scaffoldBackgroundColor,
//       child: ListTile(
//         leading: Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//             border: Border.all(color: AppColors.darkBgColor, width: 2),
//           ),
//         ),
//         title: Text(
//           "company name",
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,

//                 // color: Theme.of(context)
//                 //     .appBarTheme
//                 //     .titleTextStyle!
//                 //     .color,
//               ),
//         ),
//         subtitle: Text(
//           "notifications number: 5",
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//               fontSize: 13,
//               color: Theme.of(context).brightness == Brightness.dark
//                   ? Colors.white
//                   : Theme.of(context).textTheme.bodyMedium!.color),
//         ),
//         trailing: Container(
//           height: 18,
//           width: 18,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.blue,
//           ),
//           child: Icon(
//             Icons.check,
//             size: 15,
//             color: Theme.of(context).scaffoldBackgroundColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
class _DateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();

    // Format the day of the week and the date based on the locale
    String dayOfWeek =
        DateFormat('EEEE', Localizations.localeOf(context).languageCode)
            .format(now);
    String formattedDate =
        DateFormat('dd/MM/yyyy', Localizations.localeOf(context).languageCode)
            .format(now);

    return Expanded(
      child: Text(
        // '${AppLocalizations.of(context)!.date} :$dayOfWeek\n $formattedDate', 
        //// Add a line break after 'Date:'
        
        "test" , 
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).appBarTheme.titleTextStyle!.color,
        ),
        maxLines: 2, // Ensure only two lines are displayed
        overflow: TextOverflow.ellipsis, // Truncate with ellipsis if overflow
        textAlign:
            TextAlign.start, // Align text to start (works for both LTR and RTL)
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  final bool? isActive;
  final String? imageName, widgetName;
  final void Function()? onTap;

  HomeWidget({
    super.key,
    this.isActive,
    this.imageName,
    this.widgetName,
    this.onTap,
  });

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onTapDown: (_) {
        // Called when the user starts touching
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        // Called when the user lifts their finger
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        // Called when the touch is canceled (e.g., finger dragged off widget)
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppConstants.theNewBorderRadiusTenPX,
          boxShadow: AppConstants.theBoxShdow,
          color: isPressed
              ? AppColors
                  .darkBgColor // Gray color while the widget is being pressed
              : widget.isActive == true
                  ? AppColors.darkBgColor
                  : Colors.white, // Default colors based on isActive
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imageName!,
              width: 100,
              height: 100,
            ),
            AppConstants.emptySpaceTenPixl,
            AppConstants.emptySpaceTenPixl,
            Text(
              widget.widgetName ?? "the name",
              style: TextStyle(
                color: widget.isActive == true ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
