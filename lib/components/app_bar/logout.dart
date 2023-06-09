import 'package:flutter/material.dart';
import 'package:test_chat/components/popup.dart';
import 'package:test_chat/providers/app_services.dart';
/// Creates a Material Design app bar.
  ///
  /// The arguments [primary], [toolbarOpacity], [bottomOpacity],
  /// [backwardsCompatibility], and [automaticallyImplyLeading] must
  /// not be null. Additionally, if [elevation] is specified, it must
  /// be non-negative.
  ///
  /// Typically used in the [Scaffold.appBar] property.
Widget logout(BuildContext context, AppServices appServices) => IconButton(
      onPressed: () {
        // Mostra il popup quando l'utente fa clic sul pulsante.
        popup(context,
            title: "Do you want to sign out",
            subtitle: "Are you sure? This action is irreversible!",
            widgets: [
              ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                child: const Text("Sign out"),
                onPressed: () {
                  //Navigator.of(context).pop();
                  logOut(context, appServices);
                },
              ),
            ]);
      },
      icon: const Icon(Icons.logout),
    );

void logOut(BuildContext context, AppServices _appServices) {
  _appServices.logOut();
  Navigator.pushNamed(context, '/login');
}
