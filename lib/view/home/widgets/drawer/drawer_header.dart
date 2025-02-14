// import 'package:eloro_shop_uae/core/constants/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomDrawerHeader extends StatelessWidget {
//   final String avatarUrl;
//   final String userName;
//   final String userEmail;
//   final String backgroundImageUrl;

//   const CustomDrawerHeader({
//     super.key,
//     required this.avatarUrl,
//     required this.userName,
//     required this.userEmail,
//     required this.backgroundImageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DrawerHeader(
//       decoration: const BoxDecoration(
//         // image: DecorationImage(
//         //   image: CachedNetworkImageProvider(backgroundImageUrl,
//         //   ),
//         //   fit: BoxFit.cover,
//         // ),

//         image: DecorationImage(
//           // image: NetworkImage(backgroundImageUrl),
//           image: AssetImage(AppImages.coverPng),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: BlocBuilder<PersonalProfileBloc, PersonalProfileState>(
//         builder: (context, personalProfState) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // CircleAvatar(
//               //   radius: 40,
//               //   backgroundColor: Colors.grey.shade200,
//               //   // child: ClipOval(
//               //   //   child: CachedNetworkImage(
//               //   //     imageUrl: avatarUrl,
//               //   //     placeholder: (context, url) => const CircularProgressIndicator(),
//               //   //     errorWidget: (context, url, error) => const Icon(Icons.error),
//               //   //     fit: BoxFit.cover,
//               //   //     width: 80,
//               //   //     height: 80,
//               //   //   ),
//               //   // ),
//               // ),

//               // CircleAvatar(
//               //   radius: 35,
//               //   backgroundColor: Colors.grey.shade200,
//               //   backgroundImage: NetworkImage(
//               //     (globalCachedUserImage == null && globalCachedUserImage == "")
//               //         ? globalCachedUserImageUserDoesntExiset!
//               //         : globalCachedUserImage!,
//               //   ),
//               //   onBackgroundImageError: (_, __) {
//               //     // Fallback to an error icon
//               //   },
//               // ),
//               personalProfState is PersonalProfileSuccessState
//                   ? CircleAvatar(
//                       radius: 35,
//                       backgroundImage: globalCachedUserImage != null &&
//                               globalCachedUserImage!.isNotEmpty
//                           ? NetworkImage(
//                               globalCachedUserImage!) // Load new image if available
//                           : NetworkImage(
//                               globalCachedUserImageUserDoesntExiset!), // Fallback to default image

//                       onBackgroundImageError: (_, __) {
//                         // Handle image loading errors gracefully
//                         print("Failed to load image.");
//                       },
//                       backgroundColor: Colors.grey[200],
//                     )

//                   ///
//                   ///
//                   ///
//                   ///
//                   ///

//                   : CircleAvatar(
//                       radius: 35,
//                       backgroundImage: NetworkImage(
//                           globalCachedUserImageUserDoesntExiset!), // Fallback to default image
//                       onBackgroundImageError: (_, __) {
//                         // Handle image loading errors gracefully
//                         print("Failed to load image.");
//                       },
//                       backgroundColor: Colors.grey[200],
//                     ),

//               const SizedBox(height: 10),
//               // Text(
//               //   userName,
//               //   style: TextStyle(
//               //     // color: Theme.of(context).textTheme.bodyMedium?.color,
//               //     color: Colors.white,
//               //     fontSize: 18,
//               //     fontWeight: FontWeight.bold,
//               //   ),
//               // ),

//               // #### user name #### //
//               if (Localizations.localeOf(context).languageCode == "ar")
//                 Text(
//                   ((globalCachedArabicUserName == null ||
//                           globalCachedArabicUserName == "")
//                       ? AppLocalizations.of(context)!.userName
//                       : globalCachedArabicUserName!),
//                   style: const TextStyle(
//                     // color: Theme.of(context).textTheme.bodyMedium?.color,
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               if (Localizations.localeOf(context).languageCode == "en")
//                 Text(
//                   ((globalCachedEnglishUserName == null ||
//                           globalCachedEnglishUserName == "")
//                       ? AppLocalizations.of(context)!.userName
//                       : globalCachedEnglishUserName!),
//                   style: const TextStyle(
//                     // color: Theme.of(context).textTheme.bodyMedium?.color,
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),

//               ///
//               ///
//               ///
//               ///
//               const SizedBox(height: 5),
//               // Text(
//               //   userEmail,
//               //   style: TextStyle(
//               //     // color: Theme.of(context).textTheme.bodyMedium?.color,
//               //     color: Colors.white,
//               //     fontSize: 14,
//               //   ),
//               // ),

//               // #### user email #### //
//               Text(
//                 ((globalCachedUserEmail == null || globalCachedUserEmail == "")
//                     ? AppLocalizations.of(context)!.userEmail
//                     : globalCachedUserEmail!),
//                 maxLines: 1,
//                 style: const TextStyle(
//                   // color: Theme.of(context).textTheme.bodyMedium?.color,
//                   color: Colors.white,
//                   fontSize: 14,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),

//               ///
//               ///
//               ///
//               ///

//               const SizedBox(
//                 width: double.infinity,
//               )
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
