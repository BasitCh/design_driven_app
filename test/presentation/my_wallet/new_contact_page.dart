// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:zimpel/application/contacts/add_contact/my_wallet_bloc.dart';
// import 'package:zimpel/application/media/media_bloc/media_bloc.dart';
// import 'package:zimpel/application/media/media_detail_bloc/media_detail_bloc.dart';
// import 'package:zimpel/presentation/contacts/contact_new.dart';
//
// import '../../app/common.dart';
// import '../../app/repostries/mock_mywallet_repository.dart';
//
// void main() async {
//   Widget createTestWidget() => MaterialApp(
//         home: MultiBlocProvider(
//           providers: [
//             BlocProvider<AddContactBloc>(
//               create: (BuildContext context) =>
//                   AddContactBloc(contactRepository: MockContactRepository()),
//             ),
//             BlocProvider<MediaBloc>(
//               create: (BuildContext context) =>
//                   MediaBloc(contactRepository: MockContactRepository()),
//             ),
//             BlocProvider<MediaDetailBloc>(
//               create: (BuildContext context) =>
//                   MediaDetailBloc(contactRepository: MockContactRepository()),
//             ),
//           ],
//           child: const ContactNew(),
//         ),
//       );
//
//   testWidgets('Should Show ContactNew  Page',
//       (WidgetTester widgetTester) async {
//     await initWidgetTest(widgetTester: widgetTester);
//     await widgetTester.pumpWidget(createTestWidget());
//     expect(find.byType(ContactNew), findsOneWidget);
//   });
//
//   testWidgets('ContactNew  Showing FormBuilder',
//       (WidgetTester widgetTester) async {
//     await initWidgetTest(widgetTester: widgetTester);
//     await widgetTester.pumpWidget(createTestWidget());
//     expect(find.byType(FormBuilder), findsOneWidget);
//   });
// }
