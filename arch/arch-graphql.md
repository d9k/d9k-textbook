# Architecture: GraphQL

## About

[GraphQL](https://graphql.org/), the query language created by Facebook, overcomes several of the data retrieval issues common to the more traditional REST APIs.

Используйте GraphQL, когда хотите вернуть контроль потребителю API над тем, какие поля он хочет запрашивать.

## Over- and under-fetching

In ***over-fetching***, an endpoint responds with _more data than the client needs_, which can add to bandwidth usage.
In ***under-fetching***, no endpoint offers sufficient data, so the _client must query multiple endpoints_ to get what it needs.

## With microservices

### Apollo

(From https://tyk.io/blog/building-and-managing-graphql-microservices-with-apollo-and-tyk/)

[GraphOS](https://www.apollographql.com/docs/graphos/) .

Also [Rover CLI Client](https://www.apollographql.com/docs/rover/).

[Federation](https://www.apollographql.com/docs/federation/)