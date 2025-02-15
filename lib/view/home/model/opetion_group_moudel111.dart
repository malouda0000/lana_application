// // class OptionGroupListModel {
// //     OpetionDataModel? data;

// //     OptionGroupListModel({
// //         this.data,
// //     });

// //     OptionGroupListModel copyWith({
// //         OpetionDataModel? data,
// //     }) =>
// //         OptionGroupListModel(
// //             data: data ?? this.data,
// //         );
// // }

// // class OpetionDataModel {
// //     List<OptionGroupsLi>? optionGroupsLis;
// //     AvailableOptionLisModel? availableOptionLis;

// //     OpetionDataModel({
// //         this.optionGroupsLis,
// //         this.availableOptionLis,
// //     });

// //     OpetionDataModel copyWith({
// //         List<OptionGroupsLi>? optionGroupsLis,
// //         AvailableOptionLisModel? availableOptionLis,
// //     }) =>
// //         OpetionDataModel(
// //             optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
// //             availableOptionLis: availableOptionLis ?? this.availableOptionLis,
// //         );
// // }

// // class AvailableOptionLisModel {
// //     List<PossibilityModel>? possibilities;

// //     AvailableOptionLisModel({
// //         this.possibilities,
// //     });

// //     AvailableOptionLisModel copyWith({
// //         List<PossibilityModel>? possibilities,
// //     }) =>
// //         AvailableOptionLisModel(
// //             possibilities: possibilities ?? this.possibilities,
// //         );
// // }

// // class PossibilityModel {
// //     List<PossibilityGroupModel>? possibilityGroups;
// //     int? quantity;
// //     int? increasingPrice;

// //     PossibilityModel({
// //         this.possibilityGroups,
// //         this.quantity,
// //         this.increasingPrice,
// //     });

// //     PossibilityModel copyWith({
// //         List<PossibilityGroupModel>? possibilityGroups,
// //         int? quantity,
// //         int? increasingPrice,
// //     }) =>
// //         PossibilityModel(
// //             possibilityGroups: possibilityGroups ?? this.possibilityGroups,
// //             quantity: quantity ?? this.quantity,
// //             increasingPrice: increasingPrice ?? this.increasingPrice,
// //         );
// // }

// // class PossibilityGroupModel {
// //     int? optionGroupId;
// //     int? optionId;

// //     PossibilityGroupModel({
// //         this.optionGroupId,
// //         this.optionId,
// //     });

// //     PossibilityGroupModel copyWith({
// //         int? optionGroupId,
// //         int? optionId,
// //     }) =>
// //         PossibilityGroupModel(
// //             optionGroupId: optionGroupId ?? this.optionGroupId,
// //             optionId: optionId ?? this.optionId,
// //         );
// // }

// // class OptionGroupsLi {
// //     int? optionGroupId;
// //     bool? isColor;
// //     String? optionGroupName;
// //     String? optionGroupNameEn;
// //     bool? isMain;
// //     List<OptionModel>? options;

// //     OptionGroupsLi({
// //         this.optionGroupId,
// //         this.isColor,
// //         this.optionGroupName,
// //         this.optionGroupNameEn,
// //         this.isMain,
// //         this.options,
// //     });

// //     OptionGroupsLi copyWith({
// //         int? optionGroupId,
// //         bool? isColor,
// //         String? optionGroupName,
// //         String? optionGroupNameEn,
// //         bool? isMain,
// //         List<OptionModel>? options,
// //     }) =>
// //         OptionGroupsLi(
// //             optionGroupId: optionGroupId ?? this.optionGroupId,
// //             isColor: isColor ?? this.isColor,
// //             optionGroupName: optionGroupName ?? this.optionGroupName,
// //             optionGroupNameEn: optionGroupNameEn ?? this.optionGroupNameEn,
// //             isMain: isMain ?? this.isMain,
// //             options: options ?? this.options,
// //         );
// // }

// // class OptionModel {
// //     int? optionId;
// //     String? name;
// //     String? nameEn;
// //     String? colorHash;

// //     OptionModel({
// //         this.optionId,
// //         this.name,
// //         this.nameEn,
// //         this.colorHash,
// //     });

// //     OptionModel copyWith({
// //         int? optionId,
// //         String? name,
// //         String? nameEn,
// //         String? colorHash,
// //     }) =>
// //         OptionModel(
// //             optionId: optionId ?? this.optionId,
// //             name: name ?? this.name,
// //             nameEn: nameEn ?? this.nameEn,
// //             colorHash: colorHash ?? this.colorHash,
// //         );
// // }



// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// // ///
// // ///
// // ///
// // ///
// // ///



// // import 'dart:convert';

// // class OptionGroupListModel {
// //   final OpetionsDataMoudel? data;

// //   OptionGroupListModel({
// //     this.data,
// //   });

// //   OptionGroupListModel copyWith({
// //     OpetionsDataMoudel? data,
// //   }) =>
// //       OptionGroupListModel(
// //         data: data ?? this.data,
// //       );

// //   // factory OptionGroupListModel.fromRawJson(String str) => OptionGroupListModel.fromJson(json.decode(str));

// //   // String toRawJson() => json.encode(toJson());

// //   // factory OptionGroupListModel.fromJson(Map<String, dynamic> json) => OptionGroupListModel(
// //   //     data: json["data"] == null ? null : OpetionsDataMoudel.fromJson(json["data"]),
// //   // );

// //   // Map<String, dynamic> toJson() => {
// //   //     "data": data?.toJson(),
// //   // };

// //   factory OptionGroupListModel.fromJson(Map<String, dynamic> json) =>
// //       OptionGroupListModel(
// //         data: json["data"] != null
// //             ? OpetionsDataMoudel.fromJson(json["data"])
// //             : null,
// //       );
// // }

// // class OpetionsDataMoudel {
// //   final List<OptionGroupsLiMoudel>? optionGroupsLis;
// //   final OptionGroupsLiMoudel? availableOptionLis;

// //   OpetionsDataMoudel({
// //     this.optionGroupsLis,
// //     this.availableOptionLis,
// //   });

// //   OpetionsDataMoudel copyWith({
// //     List<OptionGroupsLiMoudel>? optionGroupsLis,
// //     OptionGroupsLiMoudel? availableOptionLis,
// //   }) =>
// //       OpetionsDataMoudel(
// //         optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
// //         availableOptionLis: availableOptionLis ?? this.availableOptionLis,
// //       );

// //   factory OpetionsDataMoudel.fromRawJson(String str) =>
// //       OpetionsDataMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory OpetionsDataMoudel.fromJson(Map<String, dynamic> json) =>
// //       OpetionsDataMoudel(
// //         optionGroupsLis: json["optionGroupsLis"] == null
// //             ? []
// //             : List<OptionGroupsLiMoudel>.from(json["optionGroupsLis"]!
// //                 .map((x) => OptionGroupsLiMoudel.fromJson(x))),
// //         availableOptionLis: json["availableOptionLis"] == null
// //             ? null
// //             : OptionGroupsLiMoudel.fromJson(json["availableOptionLis"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "optionGroupsLis": optionGroupsLis == null
// //             ? []
// //             : List<dynamic>.from(optionGroupsLis!.map((x) => x.toJson())),
// //         "availableOptionLis": availableOptionLis?.toJson(),
// //       };
// // }

// // class AvailableOptionLisMoudel {
// //   final List<PossibilityMoudel>? possibilities;

// //   AvailableOptionLisMoudel({
// //     this.possibilities,
// //   });

// //   AvailableOptionLisMoudel copyWith({
// //     List<PossibilityMoudel>? possibilities,
// //   }) =>
// //       AvailableOptionLisMoudel(
// //         possibilities: possibilities ?? this.possibilities,
// //       );

// //   factory AvailableOptionLisMoudel.fromRawJson(String str) =>
// //       AvailableOptionLisMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory AvailableOptionLisMoudel.fromJson(Map<String, dynamic> json) =>
// //       AvailableOptionLisMoudel(
// //         possibilities: json["possibilities"] == null
// //             ? []
// //             : List<PossibilityMoudel>.from(json["possibilities"]!
// //                 .map((x) => PossibilityMoudel.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "possibilities": possibilities == null
// //             ? []
// //             : List<dynamic>.from(possibilities!.map((x) => x.toJson())),
// //       };
// // }

// // class PossibilityMoudel {
// //   final List<PossibilityGroupMoudel>? possibilityGroups;
// //   final int? quantity;
// //   final int? increasingPrice;

// //   PossibilityMoudel({
// //     this.possibilityGroups,
// //     this.quantity,
// //     this.increasingPrice,
// //   });

// //   PossibilityMoudel copyWith({
// //     List<PossibilityGroupMoudel>? possibilityGroups,
// //     int? quantity,
// //     int? increasingPrice,
// //   }) =>
// //       PossibilityMoudel(
// //         possibilityGroups: possibilityGroups ?? this.possibilityGroups,
// //         quantity: quantity ?? this.quantity,
// //         increasingPrice: increasingPrice ?? this.increasingPrice,
// //       );

// //   factory PossibilityMoudel.fromRawJson(String str) =>
// //       PossibilityMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory PossibilityMoudel.fromJson(Map<String, dynamic> json) =>
// //       PossibilityMoudel(
// //         possibilityGroups: json["possibilityGroups"] == null
// //             ? []
// //             : List<PossibilityGroupMoudel>.from(json["possibilityGroups"]!
// //                 .map((x) => PossibilityGroupMoudel.fromJson(x))),
// //         quantity: json["quantity"],
// //         increasingPrice: json["increasingPrice"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "possibilityGroups": possibilityGroups == null
// //             ? []
// //             : List<dynamic>.from(possibilityGroups!.map((x) => x.toJson())),
// //         "quantity": quantity,
// //         "increasingPrice": increasingPrice,
// //       };
// // }

// // class PossibilityGroupMoudel {
// //   final int? optionGroupId;
// //   final int? optionId;

// //   PossibilityGroupMoudel({
// //     this.optionGroupId,
// //     this.optionId,
// //   });

// //   PossibilityGroupMoudel copyWith({
// //     int? optionGroupId,
// //     int? optionId,
// //   }) =>
// //       PossibilityGroupMoudel(
// //         optionGroupId: optionGroupId ?? this.optionGroupId,
// //         optionId: optionId ?? this.optionId,
// //       );

// //   factory PossibilityGroupMoudel.fromRawJson(String str) =>
// //       PossibilityGroupMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory PossibilityGroupMoudel.fromJson(Map<String, dynamic> json) =>
// //       PossibilityGroupMoudel(
// //         optionGroupId: json["optionGroupId"],
// //         optionId: json["optionId"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "optionGroupId": optionGroupId,
// //         "optionId": optionId,
// //       };
// // }

// // class OptionGroupsLiMoudel {
// //   final int? optionGroupId;
// //   final bool? isColor;
// //   final String? optionGroupName;
// //   final String? optionGroupNameEn;
// //   final bool? isMain;
// //   final List<OptionMoudel>? options;

// //   OptionGroupsLiMoudel({
// //     this.optionGroupId,
// //     this.isColor,
// //     this.optionGroupName,
// //     this.optionGroupNameEn,
// //     this.isMain,
// //     this.options,
// //   });

// //   OptionGroupsLiMoudel copyWith({
// //     int? optionGroupId,
// //     bool? isColor,
// //     String? optionGroupName,
// //     String? optionGroupNameEn,
// //     bool? isMain,
// //     List<OptionMoudel>? options,
// //   }) =>
// //       OptionGroupsLiMoudel(
// //         optionGroupId: optionGroupId ?? this.optionGroupId,
// //         isColor: isColor ?? this.isColor,
// //         optionGroupName: optionGroupName ?? this.optionGroupName,
// //         optionGroupNameEn: optionGroupNameEn ?? this.optionGroupNameEn,
// //         isMain: isMain ?? this.isMain,
// //         options: options ?? this.options,
// //       );

// //   factory OptionGroupsLiMoudel.fromRawJson(String str) =>
// //       OptionGroupsLiMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory OptionGroupsLiMoudel.fromJson(Map<String, dynamic> json) =>
// //       OptionGroupsLiMoudel(
// //         optionGroupId: json["optionGroupId"],
// //         isColor: json["isColor"],
// //         optionGroupName: json["optionGroupName"],
// //         optionGroupNameEn: json["optionGroupNameEn"],
// //         isMain: json["isMain"],
// //         options: json["options"] == null
// //             ? []
// //             : List<OptionMoudel>.from(
// //                 json["options"]!.map((x) => OptionMoudel.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "optionGroupId": optionGroupId,
// //         "isColor": isColor,
// //         "optionGroupName": optionGroupName,
// //         "optionGroupNameEn": optionGroupNameEn,
// //         "isMain": isMain,
// //         "options": options == null
// //             ? []
// //             : List<dynamic>.from(options!.map((x) => x.toJson())),
// //       };
// // }

// // class OptionMoudel {
// //   final int? optionId;
// //   final String? name;
// //   final String? nameEn;
// //   final String? colorHash;

// //   OptionMoudel({
// //     this.optionId,
// //     this.name,
// //     this.nameEn,
// //     this.colorHash,
// //   });

// //   OptionMoudel copyWith({
// //     int? optionId,
// //     String? name,
// //     String? nameEn,
// //     String? colorHash,
// //   }) =>
// //       OptionMoudel(
// //         optionId: optionId ?? this.optionId,
// //         name: name ?? this.name,
// //         nameEn: nameEn ?? this.nameEn,
// //         colorHash: colorHash ?? this.colorHash,
// //       );

// //   factory OptionMoudel.fromRawJson(String str) =>
// //       OptionMoudel.fromJson(json.decode(str));

// //   String toRawJson() => json.encode(toJson());

// //   factory OptionMoudel.fromJson(Map<String, dynamic> json) => OptionMoudel(
// //         optionId: json["optionId"],
// //         name: json["name"],
// //         nameEn: json["nameEn"],
// //         colorHash: json["colorHash"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "optionId": optionId,
// //         "name": name,
// //         "nameEn": nameEn,
// //         "colorHash": colorHash,
// //       };
// // }

// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///



// // import 'dart:convert';

// // class OptionGroupListModel {
// //     final Data? data;

// //     OptionGroupListModel({
// //         this.data,
// //     });

// //     OptionGroupListModel copyWith({
// //         Data? data,
// //     }) => 
// //         OptionGroupListModel(
// //             data: data ?? this.data,
// //         );

// //     factory OptionGroupListModel.fromRawJson(String str) => OptionGroupListModel.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory OptionGroupListModel.fromJson(Map<String, dynamic> json) => OptionGroupListModel(
// //         data: json["data"] == null ? null : Data.fromJson(json["data"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "data": data?.toJson(),
// //     };
// // }

// // class Data {
// //     final List<OptionGroupsLi>? optionGroupsLis;
// //     final AvailableOptionLis? availableOptionLis;

// //     Data({
// //         this.optionGroupsLis,
// //         this.availableOptionLis,
// //     });

// //     Data copyWith({
// //         List<OptionGroupsLi>? optionGroupsLis,
// //         AvailableOptionLis? availableOptionLis,
// //     }) => 
// //         Data(
// //             optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
// //             availableOptionLis: availableOptionLis ?? this.availableOptionLis,
// //         );

// //     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         optionGroupsLis: json["optionGroupsLis"] == null ? [] : List<OptionGroupsLi>.from(json["optionGroupsLis"]!.map((x) => OptionGroupsLi.fromJson(x))),
// //         availableOptionLis: json["availableOptionLis"] == null ? null : AvailableOptionLis.fromJson(json["availableOptionLis"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "optionGroupsLis": optionGroupsLis == null ? [] : List<dynamic>.from(optionGroupsLis!.map((x) => x.toJson())),
// //         "availableOptionLis": availableOptionLis?.toJson(),
// //     };
// // }

// // class AvailableOptionLis {
// //     final List<Possibility>? possibilities;

// //     AvailableOptionLis({
// //         this.possibilities,
// //     });

// //     AvailableOptionLis copyWith({
// //         List<Possibility>? possibilities,
// //     }) => 
// //         AvailableOptionLis(
// //             possibilities: possibilities ?? this.possibilities,
// //         );

// //     factory AvailableOptionLis.fromRawJson(String str) => AvailableOptionLis.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory AvailableOptionLis.fromJson(Map<String, dynamic> json) => AvailableOptionLis(
// //         possibilities: json["possibilities"] == null ? [] : List<Possibility>.from(json["possibilities"]!.map((x) => Possibility.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "possibilities": possibilities == null ? [] : List<dynamic>.from(possibilities!.map((x) => x.toJson())),
// //     };
// // }

// // class Possibility {
// //     final List<PossibilityGroup>? possibilityGroups;
// //     final int? quantity;
// //     final int? increasingPrice;

// //     Possibility({
// //         this.possibilityGroups,
// //         this.quantity,
// //         this.increasingPrice,
// //     });

// //     Possibility copyWith({
// //         List<PossibilityGroup>? possibilityGroups,
// //         int? quantity,
// //         int? increasingPrice,
// //     }) => 
// //         Possibility(
// //             possibilityGroups: possibilityGroups ?? this.possibilityGroups,
// //             quantity: quantity ?? this.quantity,
// //             increasingPrice: increasingPrice ?? this.increasingPrice,
// //         );

// //     factory Possibility.fromRawJson(String str) => Possibility.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory Possibility.fromJson(Map<String, dynamic> json) => Possibility(
// //         possibilityGroups: json["possibilityGroups"] == null ? [] : List<PossibilityGroup>.from(json["possibilityGroups"]!.map((x) => PossibilityGroup.fromJson(x))),
// //         quantity: json["quantity"],
// //         increasingPrice: json["increasingPrice"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "possibilityGroups": possibilityGroups == null ? [] : List<dynamic>.from(possibilityGroups!.map((x) => x.toJson())),
// //         "quantity": quantity,
// //         "increasingPrice": increasingPrice,
// //     };
// // }

// // class PossibilityGroup {
// //     final int? optionGroupId;
// //     final int? optionId;

// //     PossibilityGroup({
// //         this.optionGroupId,
// //         this.optionId,
// //     });

// //     PossibilityGroup copyWith({
// //         int? optionGroupId,
// //         int? optionId,
// //     }) => 
// //         PossibilityGroup(
// //             optionGroupId: optionGroupId ?? this.optionGroupId,
// //             optionId: optionId ?? this.optionId,
// //         );

// //     factory PossibilityGroup.fromRawJson(String str) => PossibilityGroup.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory PossibilityGroup.fromJson(Map<String, dynamic> json) => PossibilityGroup(
// //         optionGroupId: json["optionGroupId"],
// //         optionId: json["optionId"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "optionGroupId": optionGroupId,
// //         "optionId": optionId,
// //     };
// // }

// // class OptionGroupsLi {
// //     final int? optionGroupId;
// //     final bool? isColor;
// //     final String? optionGroupName;
// //     final String? optionGroupNameEn;
// //     final bool? isMain;
// //     final List<Option>? options;

// //     OptionGroupsLi({
// //         this.optionGroupId,
// //         this.isColor,
// //         this.optionGroupName,
// //         this.optionGroupNameEn,
// //         this.isMain,
// //         this.options,
// //     });

// //     OptionGroupsLi copyWith({
// //         int? optionGroupId,
// //         bool? isColor,
// //         String? optionGroupName,
// //         String? optionGroupNameEn,
// //         bool? isMain,
// //         List<Option>? options,
// //     }) => 
// //         OptionGroupsLi(
// //             optionGroupId: optionGroupId ?? this.optionGroupId,
// //             isColor: isColor ?? this.isColor,
// //             optionGroupName: optionGroupName ?? this.optionGroupName,
// //             optionGroupNameEn: optionGroupNameEn ?? this.optionGroupNameEn,
// //             isMain: isMain ?? this.isMain,
// //             options: options ?? this.options,
// //         );

// //     factory OptionGroupsLi.fromRawJson(String str) => OptionGroupsLi.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory OptionGroupsLi.fromJson(Map<String, dynamic> json) => OptionGroupsLi(
// //         optionGroupId: json["optionGroupId"],
// //         isColor: json["isColor"],
// //         optionGroupName: json["optionGroupName"],
// //         optionGroupNameEn: json["optionGroupNameEn"],
// //         isMain: json["isMain"],
// //         options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "optionGroupId": optionGroupId,
// //         "isColor": isColor,
// //         "optionGroupName": optionGroupName,
// //         "optionGroupNameEn": optionGroupNameEn,
// //         "isMain": isMain,
// //         "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
// //     };
// // }

// // class Option {
// //     final int? optionId;
// //     final String? name;
// //     final String? nameEn;
// //     final String? colorHash;

// //     Option({
// //         this.optionId,
// //         this.name,
// //         this.nameEn,
// //         this.colorHash,
// //     });

// //     Option copyWith({
// //         int? optionId,
// //         String? name,
// //         String? nameEn,
// //         String? colorHash,
// //     }) => 
// //         Option(
// //             optionId: optionId ?? this.optionId,
// //             name: name ?? this.name,
// //             nameEn: nameEn ?? this.nameEn,
// //             colorHash: colorHash ?? this.colorHash,
// //         );

// //     factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory Option.fromJson(Map<String, dynamic> json) => Option(
// //         optionId: json["optionId"],
// //         name: json["name"],
// //         nameEn: json["nameEn"],
// //         colorHash: json["colorHash"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "optionId": optionId,
// //         "name": name,
// //         "nameEn": nameEn,
// //         "colorHash": colorHash,
// //     };
// // }



// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///



// // import 'dart:convert';

// // class OptionGroupListModel {
// //     final Data? data;

// //     OptionGroupListModel({
// //         this.data,
// //     });

// //     OptionGroupListModel copyWith({
// //         Data? data,
// //     }) => 
// //         OptionGroupListModel(
// //             data: data ?? this.data,
// //         );

// //     factory OptionGroupListModel.fromRawJson(String str) => OptionGroupListModel.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory OptionGroupListModel.fromJson(Map<String, dynamic> json) => OptionGroupListModel(
// //         data: json["data"] != null ? Data.fromJson(json["data"]) : null,
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "data": data?.toJson(),
// //     };
// // }

// // class Data {
// //     final List<OptionGroupsLi>? optionGroupsLis;
// //     final AvailableOptionLis? availableOptionLis;

// //     Data({
// //         this.optionGroupsLis,
// //         this.availableOptionLis,
// //     });

// //     Data copyWith({
// //         List<OptionGroupsLi>? optionGroupsLis,
// //         AvailableOptionLis? availableOptionLis,
// //     }) => 
// //         Data(
// //             optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
// //             availableOptionLis: availableOptionLis ?? this.availableOptionLis,
// //         );

// //     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         optionGroupsLis: json["optionGroupsLis"] != null 
// //             ? List<OptionGroupsLi>.from(json["optionGroupsLis"].map((x) => OptionGroupsLi.fromJson(x))) 
// //             : [],
// //         availableOptionLis: json["availableOptionLis"] != null 
// //             ? AvailableOptionLis.fromJson(json["availableOptionLis"]) 
// //             : null,
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "optionGroupsLis": optionGroupsLis != null 
// //             ? List<dynamic>.from(optionGroupsLis!.map((x) => x.toJson())) 
// //             : [],
// //         "availableOptionLis": availableOptionLis?.toJson(),
// //     };
// // }

// // class AvailableOptionLis {
// //     final List<Possibility>? possibilities;

// //     AvailableOptionLis({
// //         this.possibilities,
// //     });

// //     AvailableOptionLis copyWith({
// //         List<Possibility>? possibilities,
// //     }) => 
// //         AvailableOptionLis(
// //             possibilities: possibilities ?? this.possibilities,
// //         );

// //     factory AvailableOptionLis.fromRawJson(String str) => AvailableOptionLis.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory AvailableOptionLis.fromJson(Map<String, dynamic> json) => AvailableOptionLis(
// //         possibilities: json["possibilities"] != null 
// //             ? List<Possibility>.from(json["possibilities"].map((x) => Possibility.fromJson(x))) 
// //             : [],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "possibilities": possibilities != null 
// //             ? List<dynamic>.from(possibilities!.map((x) => x.toJson())) 
// //             : [],
// //     };
// // }

// // class Possibility {

// //     final List<dynamic>? possibilityGroups;    final int? quantity;
// //     final int? increasingPrice;

// //     Possibility({
// //         this.possibilityGroups,
// //         this.quantity,
// //         this.increasingPrice,
// //     });

// //     Possibility copyWith({

// //         List<dynamic>? possibilityGroups,
// //         int? quantity,
// //         int? increasingPrice,
// //     }) => 
// //         Possibility(
// //             possibilityGroups: possibilityGroups ?? this.possibilityGroups,
// //             quantity: quantity ?? this.quantity,
// //             increasingPrice: increasingPrice ?? this.increasingPrice,
// //         );

// //     factory Possibility.fromRawJson(String str) => Possibility.fromJson(json.decode(str));

// //     String toRawJson() => json.encode(toJson());

// //     factory Possibility.fromJson(Map<String, dynamic> json) => Possibility(
// //         possibilityGroups: json["possibilityGroups"] != null 

// //             ? List<dynamic>.from(json["possibilityGroups"].map((x) => x)) 
// //             : [],
// //         quantity: json["quantity"],
// //         increasingPrice: json["increasingPrice"],

// //     );
// //     Map<String, dynamic> toJson() => {
// //         "possibilityGroups": possibilityGroups != null 
// //             ? List<dynamic>.from(possibilityGroups!.map((x) => x.toJson())) 
// //             : [],
// //         "quantity": quantity,
// //         "increasingPrice": increasingPrice,
// //     };
// // }






// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
// ///
 

//  // #### working version of the file #### // 


// import 'dart:convert';

// class OptionGroupListModel {
//     final Data? data;

//     OptionGroupListModel({
//         this.data,
//     });

//     OptionGroupListModel copyWith({
//         Data? data,
//     }) => 
//         OptionGroupListModel(
//             data: data ?? this.data,
//         );

//     factory OptionGroupListModel.fromRawJson(String str) => OptionGroupListModel.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory OptionGroupListModel.fromJson(Map<String, dynamic> json) => OptionGroupListModel(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//     };
// }

// class Data {
//     final List<OptionGroupsLi>? optionGroupsLis;
//     final AvailableOptionLis? availableOptionLis;

//     Data({
//         this.optionGroupsLis,
//         this.availableOptionLis,
//     });

//     Data copyWith({
//         List<OptionGroupsLi>? optionGroupsLis,
//         AvailableOptionLis? availableOptionLis,
//     }) => 
//         Data(
//             optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
//             availableOptionLis: availableOptionLis ?? this.availableOptionLis,
//         );

//     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         optionGroupsLis: json["optionGroupsLis"] == null ? [] : List<OptionGroupsLi>.from(json["optionGroupsLis"]!.map((x) => OptionGroupsLi.fromJson(x))),
//         availableOptionLis: json["availableOptionLis"] == null ? null : AvailableOptionLis.fromJson(json["availableOptionLis"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "optionGroupsLis": optionGroupsLis == null ? [] : List<dynamic>.from(optionGroupsLis!.map((x) => x.toJson())),
//         "availableOptionLis": availableOptionLis?.toJson(),
//     };
// }

// class AvailableOptionLis {
//     final List<Possibility>? possibilities;

//     AvailableOptionLis({
//         this.possibilities,
//     });

//     AvailableOptionLis copyWith({
//         List<Possibility>? possibilities,
//     }) => 
//         AvailableOptionLis(
//             possibilities: possibilities ?? this.possibilities,
//         );

//     factory AvailableOptionLis.fromRawJson(String str) => AvailableOptionLis.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory AvailableOptionLis.fromJson(Map<String, dynamic> json) => AvailableOptionLis(
//         possibilities: json["possibilities"] == null ? [] : List<Possibility>.from(json["possibilities"]!.map((x) => Possibility.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "possibilities": possibilities == null ? [] : List<dynamic>.from(possibilities!.map((x) => x.toJson())),
//     };
// }

// class Possibility {
//     final List<PossibilityGroup>? possibilityGroups;
//     final int? quantity;
//     final int? increasingPrice;

//     Possibility({
//         this.possibilityGroups,
//         this.quantity,
//         this.increasingPrice,
//     });

//     Possibility copyWith({
//         List<PossibilityGroup>? possibilityGroups,
//         int? quantity,
//         int? increasingPrice,
//     }) => 
//         Possibility(
//             possibilityGroups: possibilityGroups ?? this.possibilityGroups,
//             quantity: quantity ?? this.quantity,
//             increasingPrice: increasingPrice ?? this.increasingPrice,
//         );

//     factory Possibility.fromRawJson(String str) => Possibility.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Possibility.fromJson(Map<String, dynamic> json) => Possibility(
//         possibilityGroups: json["possibilityGroups"] == null ? [] : List<PossibilityGroup>.from(json["possibilityGroups"]!.map((x) => PossibilityGroup.fromJson(x))),
//         quantity: json["quantity"],
//         increasingPrice: json["increasingPrice"],
//     );

//     Map<String, dynamic> toJson() => {
//         "possibilityGroups": possibilityGroups == null ? [] : List<dynamic>.from(possibilityGroups!.map((x) => x.toJson())),
//         "quantity": quantity,
//         "increasingPrice": increasingPrice,
//     };
// }

// class PossibilityGroup {
//     final int? optionGroupId;
//     final int? optionId;

//     PossibilityGroup({
//         this.optionGroupId,
//         this.optionId,
//     });

//     PossibilityGroup copyWith({
//         int? optionGroupId,
//         int? optionId,
//     }) => 
//         PossibilityGroup(
//             optionGroupId: optionGroupId ?? this.optionGroupId,
//             optionId: optionId ?? this.optionId,
//         );

//     factory PossibilityGroup.fromRawJson(String str) => PossibilityGroup.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory PossibilityGroup.fromJson(Map<String, dynamic> json) => PossibilityGroup(
//         optionGroupId: json["optionGroupId"],
//         optionId: json["optionId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "optionGroupId": optionGroupId,
//         "optionId": optionId,
//     };
// }

// class OptionGroupsLi {
//     final int? optionGroupId;
//     final bool? isColor;
//     final String? optionGroupName;
//     final String? optionGroupNameEn;
//     final bool? isMain;
//     final List<Option>? options;

//     OptionGroupsLi({
//         this.optionGroupId,
//         this.isColor,
//         this.optionGroupName,
//         this.optionGroupNameEn,
//         this.isMain,
//         this.options,
//     });

//     OptionGroupsLi copyWith({
//         int? optionGroupId,
//         bool? isColor,
//         String? optionGroupName,
//         String? optionGroupNameEn,
//         bool? isMain,
//         List<Option>? options,
//     }) => 
//         OptionGroupsLi(
//             optionGroupId: optionGroupId ?? this.optionGroupId,
//             isColor: isColor ?? this.isColor,
//             optionGroupName: optionGroupName ?? this.optionGroupName,
//             optionGroupNameEn: optionGroupNameEn ?? this.optionGroupNameEn,
//             isMain: isMain ?? this.isMain,
//             options: options ?? this.options,
//         );

//     factory OptionGroupsLi.fromRawJson(String str) => OptionGroupsLi.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory OptionGroupsLi.fromJson(Map<String, dynamic> json) => OptionGroupsLi(
//         optionGroupId: json["optionGroupId"],
//         isColor: json["isColor"],
//         optionGroupName: json["optionGroupName"],
//         optionGroupNameEn: json["optionGroupNameEn"],
//         isMain: json["isMain"],
//         options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "optionGroupId": optionGroupId,
//         "isColor": isColor,
//         "optionGroupName": optionGroupName,
//         "optionGroupNameEn": optionGroupNameEn,
//         "isMain": isMain,
//         "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
//     };
// }

// class Option {
//     final int? optionId;
//     final String? name;
//     final String? nameEn;
//     final String? colorHash;

//     Option({
//         this.optionId,
//         this.name,
//         this.nameEn,
//         this.colorHash,
//     });

//     Option copyWith({
//         int? optionId,
//         String? name,
//         String? nameEn,
//         String? colorHash,
//     }) => 
//         Option(
//             optionId: optionId ?? this.optionId,
//             name: name ?? this.name,
//             nameEn: nameEn ?? this.nameEn,
//             colorHash: colorHash ?? this.colorHash,
//         );

//     factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Option.fromJson(Map<String, dynamic> json) => Option(
//         optionId: json["optionId"],
//         name: json["name"],
//         nameEn: json["nameEn"],
//         colorHash: json["colorHash"],
//     );

//     Map<String, dynamic> toJson() => {
//         "optionId": optionId,
//         "name": name,
//         "nameEn": nameEn,
//         "colorHash": colorHash,
//     };
// } 