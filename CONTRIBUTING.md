# Contributing to WHAC19 App


## Getting Started & Development

You will need to install and setup Flutter to develop this application. You can read more on how to set up Flutter [here](https://flutter.dev/docs/get-started/install).

**Tip!**: If you are using Visual Studio Code as your IDE (Code Editor), the [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) is really useful and helpful to perform multiple actions such as:

- the installation of dependencies
- running the application

### **BETA CHANNEL USAGE**

We are currently using the Flutter v1.15.17 (the current beta channel version) for app development, so once you have the Flutter SDK set-up and working please change to the beta channel using on the command line:

```
flutter channel beta
flutter upgrade
```

### Installing dependencies

To install dependencies, simply run `flutter pub get` in your terminal.

### Developing the app

#### iOS

For iOS Flutter development you will need to have Xcode v13.3 installed. Then initialise an instance of an iOS Simulator or connect physical iOS device, navigate to the cloned repo and run from root:

```sh
# from terminal

open -a simulator

cd <your-workspace>/wh_covid19_app
flutter run -d "iPhone"
```

#### Android

##### Development

If you have a device plugged in just run:

```
flutter run
```

Otherwise if you have setup [Android Studio](https://developer.android.com/studio) and/or the Android Software Development Kit (SDK) you can run it over a virtual Android emulator using the Android Debug Bridge (ADB). Just simply run:

```
flutter run adb
```

## Contributing as a developer

Check our [issues page](https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app/issues?q=is%3Aopen+is%3Aissue+label%3A%22Ready+for+Dev%22) `ready for dev` issues to work on.  

Look for issues that have not been assigned to anyone.  If you are working on a particular issue, please assign yourself to it. If an assignee is currently working on an issue that you are interested in, ask if they want help. If they agree, then add yourself to the assignment. Other than the assignees on the assignment list, nobody else should be working on the same issue.

Before you submit a PR, please ENSURE that you have run the following terminal commands locally in the root of the Flutter project and all the steps pass:

```
flutter clean
flutter format .
flutter analyze
flutter test
```
It's ***strongly*** recommended that you enabled "format on save" in your preferred IDE for Flutter (dart) code files.

When contributing to this repository, please first discuss the change you wish to make via slack, issue, or email or any other method with the owners of this repository before making a change.

**Pro tips**

🔥 If you are committing changes to the docs ***ONLY*** add `[skip ci]` to **all** of your commit messages to save build time as we are currently burning build minutes 😬. Also prefix your PR title with `Docs: ` so that its obvious to the project team what the PR is.

📱 Pick a device with a low resolution to test on and make sure there are no overflow errors.

🎨 Check against the designs in Zeplin.

☑️ Only open up a PR once you feel you are finished.  You can request a review from `Flutter devs` get reviews

🤗 If you are unsure about something please ask for help.  We are really friendly!


Currently the project is being primarily co-ordinated via the GDG Melbourne slack group. You can join GDG Melbourne's slack via [this invite](http://bit.ly/join_gdgslack). DM `@luke.sleeman` on GDG Melbourne slack to be invited to the channel being used for co-ordination.

If you have any questions about why things are done a certain way in the app, check out the [Architecture Decision Records](docs/Architecture) - they should be able to provide some background on why things are done a specific way.

### Pull Request Process

## Method 1 - If you are part of the team
- Please make sure the work you are doing is described in an existing Github issue.
- Develop your work in a branch. Branch names should be prefixed with `feature`, `tech`, `docs` or `bugfix` depending on what is being done in them AND should contain the number of the matching Github issue. eg: `feature/142-update-homescreen`
- Open a pull request onto master. Be sure to include a detailed description in your pull request per the PR template. Other contributors will comment on your code or approve it
- Please be sure to note the build status of your PR reported by the Codemagic CI
- Once your pull request has been approved, please merge into master.

## Method 2 - If you are not yet part of the team
- If you are not a part of the team, you can still work on the code by clicking on the `Fork` option in this page.
- Once you have forked to your own github account,  you will be able to check out the fork and work on it.
- To create a pull request, you would have to push your local changes back to your git accounts fork. 
- You would then find the option to `Compare and Pull Request`. 
- Please follow the instructions above on how to submit a pull request. 
- Once the pull request is reviewed and approved by the team, they would be able to merge this with the main branch. 


## The Development process

Everything is coordinated through Github issues.  The current development process is:

👨‍⚕️👩‍⚕️ **Gregg Miller** and other Western Health staff provide features, content and suggestions via GitHub issues.  Gregg & Co can create new issues for features to add, things that need changing, etc.  

If you need any help from the WH staff, you can label an issue as `Medic`.  [These issues currently need medic advice](https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app/issues?q=is%3Aopen+is%3Aissue+label%3AMedic). You can also `@` mention and assign issues to `@Western-Health-Covid19-Collaboration/medical` in a comment to notify the whole WH team.

The WH staff can label issues as `#1 Priority`, `#2 Priority`, `#3 Priority`.  Everybody on the team should focus on #1 priority issues first, then #2 and so on.

Once a issue has all the appropriate info it, it can be labeled `design` to hand over to the next step ...

⬇️

👩‍🎨👨‍🎨 **Marc Edwards** and other designers help design and specify features.  They  upload designs to zeplin and add design guidance into the issues.  

If you need any help from the design team, you can label an issue as `design`.  [These issues currently need design guidance](https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app/issues?q=is%3Aopen+is%3Aissue+label%3Adesign).   You can also `@` mention `@Western-Health-Covid19-Collaboration/designers` in a comment to notify the whole design team.

Once they have done their ✨ magic ✨ the issue should be labeled as 'Ready for dev' ...

 
👩‍💻👨‍💻 **Developers** pick up [ready for Dev issues](https://github.com/Western-Health-Covid19-Collaboration/wh_covid19_app/issues?q=is%3Aopen+is%3Aissue+label%3A%22Ready+for+Dev%22+) and submit PRs to the project when then get approved and merged.  If you are working on developing an issue, be sure to assign yourself to it.  If you want to work on an issue and someone already is, ask if they want help.  If they agree add yourself to the assignment.
 
⬇️

🖥 **CI** builds the app and deploys to phones via firebase app distribution.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](Code-of-conduct.md). By participating, you are expected to uphold this code. Please report unacceptable behaviour to the project team.
