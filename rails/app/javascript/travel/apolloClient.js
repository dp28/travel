import { ApolloClient } from "apollo-client";
import { HttpLink } from "apollo-link-http";
import { InMemoryCache } from "apollo-cache-inmemory";
import gql from "graphql-tag";

const DataSource = new InMemoryCache();

prepopulate(DataSource);

export const Client = new ApolloClient({
  link: new HttpLink(),
  cache: DataSource,
  defaultOptions: {
    query: {
      fetchPolicy: "cache-only",
    },
    watchQuery: {
      fetchPolicy: "cache-only",
    },
  },
});

function prepopulate(cache) {
  if (!RnDTravelsData) {
    console.error("Data not loaded");
    return;
  }

  Object.entries(RnDTravelsData).forEach(([query, variablesToResults]) => {
    Object.entries(variablesToResults).forEach(([variablesString, result]) => {
      cache.writeQuery({
        query: gql(query),
        variables: JSON.parse(variablesString),
        data: result.data,
      });
    });
  });
}
