# USe Flutter beta Channel

## Status

Accepted

## Context

There are 3 different versions of flutter that you can build out against: Stable, Beta and Dev.  Each comes with different trade offs.

Currently there has been a missed stable release, and Beta is required to build iOS correctly.

## Decision

We are using the beta channel.  Once some of the fixes land in stable, we may decide to revisit this decision.

## Consequences

iOS will build correctly, and we will be able to support the web target.