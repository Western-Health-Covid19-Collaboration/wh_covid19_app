# Embed content in the app

## Status

Accepted

## Context

The app primarily displays information for medical staff working in hospitals.  The information needs to come from somewhere and there are a few options:

### Download content from a CMS/S3 bucket/Website
We could pull the information in the app from somewhere on the web.  Some kind of CMS, S3 bucket or website where the files are hosted would be the most obvious choices.

This does make it easier to quickly the information in the app, but would require the build out of more infrastructure and architecture to support all this.

It also could mean that if the internet connection goes down to a hospital in  a crisis any information that isn't already cached in the app would be unavailable to users.


### Embed the content in the app
The alternative method is to embed all of the information in the app so that all of the information is included, after downloading the app.

This is architecturally much simpler and means all the content will be available offline if the internet should go down.

Subsequently, a new version of the app needs to be released to update the information.

## Decision

For the initial versions of the application, we will embed the content in the app.

Once the situation stabilises, and we can provide support to more hospitals, we can re-visit the decision and decide if we want to download content.

## Consequences

Updating content in the app is a little harder as we need to change the codebase and deploy an update to the play/app store.

However the initial version of the app will be much simpler and faster to produce.
