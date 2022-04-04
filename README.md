# Ellume Coding Exercise


## SwiftUI-MVVM
A project that uses SwiftUI and swift 5.5, MVVM for software architecture.

## New swift(swift 5.5) features used
- Async/await
- Actors(@MainActor)

## Compatibility
- Xcode 13.2
- iOS 15 and later
- SwiftUI 3
- Swift 5.5

## Project overview
 - Use the They Said So API (https://theysaidso.com/api/
Quotes API from They Said So
The They Said So website holds an extensive database with over a million quotes from a hundred thousand different authors. Developers can access all these quotes through the API, which also categorizes the quotes to find them easier.
theysaidso.com) to randomly select a category from those available and retrieve the quote of the day for that category then:

        a. Set the email subject to the quote title
        b. Set the message body to the quote and author

- The user can specify a list of recipients.

- When the user taps the Send button, the email is sent to the recipients.

## Screens 
<img src = "screenshot/home.png" width = "200" hight = "420"> <img src = "screenshot/details.png" width = "200" hight = "420"><img src = "screenshot/email.png" width = "200" hight = "420"><img src = "screenshot/device-not-support.png" width = "200" hight = "420">

## What you can find in this project
 ### Home screen :
- Categories sorted by alphabetical order.

 ### Second screen :
- quote title
- Quote
- Author Name

 ### Unit test : covered(60.5%)
- functional testing covered
<img src = "screenshot/unit-test.png" width = "700" hight = "650">
- Automation UI testing - covered(20%)

## Project Folder structure
<img src = "screenshot/folderstructure.png" width = "300" hight = "420">

## License
Copyright tdmihiran@gmail.com,  Licensed under the MIT license.
