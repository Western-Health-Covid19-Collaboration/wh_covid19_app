# Use Flutter

## Status

Accepted

## Context

Flutter is a framework for building apps provided by Google.  Google describes it as a:
> ... UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.

It emphasizes fast development, expressive and flexible UI, and native performance.

Gregg Miller, a Senior Anesthesiologist at Western Health hospitals, reached out to us with a mobile app he had been developing to provide COVID-19 information to frontline medical staff.  The app that Gregg had developed in was with Flutter.  Gregg sought assistance and guidance from the GDG community to help him complete the app.  Considering time constraints, we needed to put together and ship an app to the hospital before the crisis swamped the staff, which at that time as predicted to occur in about two weeks.

Luke immediately put out the call and assembled a team of Flutter developers from the GDG community.  We performed an initial evaluation on the codebase and decided that it would be best to deliver a re-write rather than building on the existing codebase.

At this stage it would have been possible to drop Flutter and build out native applications, or built the app using some other cross platform toolkit such as react native.

## Decision

Time was of the essence - as we already had a team of Flutter developers ready to go we decided to continue on with using Flutter to build the app.  It was also likely that Flutters emphasis on fast development and an expressive UI would be helpful in quickly building out the app.

## Consequences

The app is built in Flutter.  This means that it will be easy to build both iOS and Android versions of the app from a single codebase.  However addressing platform specific issues may be more complicated.  This also means that any devs wishing to contribute to the project will have to be familiar with Flutter.
