# Use Flutter beta Channel

## Status

Accepted

## Context

There are three different versions of flutter that you can build out: Stable, Beta and Dev. Each version will come with various trade-offs.

Currently, there has been a missed stable release, and Beta is required to build iOS correctly.

## Decision

We are using the beta channel.  Once some of the fixes land in stable, we may decide to revisit this decision.

## Consequences

iOS will build correctly, and we will be able to support the web target.
