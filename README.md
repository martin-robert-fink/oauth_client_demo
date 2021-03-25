# <b>OAuth2 Demonstrator - Flutter Client Component</b>

An OAuth2 Demonstrator Client Companion to Oauth2 Server Demonstrator.  You can find the server repo [here](https://github.com/martin-robert-fink/oauth_server_demo).

The primary purpose of this client is to initiate the authentication flow with one of Google, Apple, Facebook or Github.  The [OAuth2 server demonstrator](https://github.com/martin-robert-fink/oauth_server_demo) will receive all the redirect calls from all of the providers to complete the authentication process.

To understand the details of how this complete flow works, check the readme file on the server repo for the complete authentication flow.

In order to also demonstrate API calls with token validation, this client creates fake tasks and makes API calls to store and retreive those tasks.  Those calls include an id_token to ensure the API call is valid.

This client app maintains Login state as well as a local copy of all the tokens (access, refresh, and id). It has been tested to work on iOS, Android, MacOS, Linux and Windows (not web). It is also null-safe.  The server component is not as it depends on the mongodb_dart plugin which is not yet null-safe.

# Application Structure

I use GetX for state management, navigation, and a few other useful functions (displaying snackbars).  This is not intended to be a GetX demonstrator, it just happens to be what I use for those functions.

I internalizationalize all my Flutter apps as a matter of course.  It ensures that I keep text strings out of the code, but also allows me to check things like RTL languages.  I use the VSCode Flutter Intl plugin for internationalization (it's also available for Android Studio).  The app is localized in English, French, Hebrew, and Arabic.  I only speak English and French.  The Hebrew/Arabic translations are just Google Translate strings.  I can't really read them.  In `main.dart` look for the `locale` parameters in `GetMaterialApp` to try different languages (one of `en`, `fr`, `ar`, or `he` will work).  The localized arb files are in the `l10n` folder.

`GetMaterialApp` will decide which page to display based on the logged-in status of the user.  There are only two pages the `pages` folder.  The `LoginPage` widget will be called if the user is logged out and display the four provider choices to login with.  The `MainPage` will display if the user is logged in.  The `MainPage` will retrieve all the active tasks from the server.  There's a + button at the top to add a new fake tasks.  You can swipe left to delete a task.  There's a logout button on the top right corner.

As I mentioned, GetX is used for state management.  The `controllers` folder has a `TaskController` which is responsible for maintaining the current state as well as performing all the task operations with the server.

As described in the web flow in the [Oauth Server Demo](https://github.com/martin-robert-fink/oauth_server_demo) readme file, the authentication process begins here with the client.  When the user taps/clicks on a Social Provider, the authentication process is launched.  The launchURL is a bit different for each provider and this is handled by specialized versions of the `SocialAuth` base abstract class.

The process begins by establishing a WebSocket connection to the Dart server and then simply listening for a response.  As soon as the CSRF state is transmitted to the server, then the authentication URL specific to the provider login is launched and the user is taken there to authenticate.  Assuming the user successfully logs in, the Dart OAuth server will take over and complete the process.  The process completes when this client receives a set of tokens through the websocket connection.  Assuming all goes well, the user is logged in and taken to the `MainPage` widget to work on tasks.

One of the key features of this client is that no `client_id` or `client_secret` values are stored locally.  The `client_id` (which is required for the initial authentication) is retreived from the Dart server via an API call.  Only the server needs to be aware of the `client_secret`.

This client is also responsible for storing tokens locally using `shared_preferences`, as well as requesting a token refresh when tokens expire.  Look at `token.dart` in the `auth` folder for details.  The function called `clearTokenData` also has a special provision to deal with a bug in the `shared_preferences` plugin that only manifests itself on Linux and Windows.

The `user.dart` file in the `auth` folder is responsible for the login/logout/isLoggedIn functionality

# A few setup things

You'll need to change a couple of constants in `lib/constants/auth.dart`.  Change `AUTH_ENDPOINT` and `API_HOST` to match your server.

Android, iOS and MacOS have some setup required to get custom URL schemes to work.  Although I don't use the `uni_links` plugin, the setup for custom URL schemes is required.  Read the readme for that plugin for details on how to do that.  For android, look at the file `android/app/src/main/AndroidManifest.xml`, change the entry `android:scheme` to match your domain.  On iOS/MacOS check the `<macos or ios>/Runner/info.plist` file and look for the entry `<key>CFBundleURLSchemes</key>` and change the url to match your domain.

MacOS has some entitlements required to be able to use networking.  Again, your `macos/Runner/DebugProfile.entitlements` file should be already adapted for this to work.  The one that has been set for you is `<key>com.apple.security.network.client</key>`.  The `Release.entitlements` file has also been set for you.

In `main.dart` you'll also see a section at the top referencing `HttpOverrides`.  This section is only required to get everything to work on the android simulator.  It should not be required for any other platform.

# Feedback

I hope you're able to make use of this demonstrator to understand the inner working for a number of OAuth2 providers.  There are many others and it would interesting to see how easy adding a new one would be.  If you have any feedback, comments, suggestions, recommendations on this project, you can reach me at [Martin Fink](mailto:martin.robert.fink@gmail.com).



