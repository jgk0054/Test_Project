import { ApolloClient } from 'apollo-client'
import { createHttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'

// HTTP connection to the API
const httpLink = createHttpLink({
    // You should use an absolute URL here
    uri: 'http://localhost:4000/graphiql',
})

// Cache implementation
const cache = new InMemoryCache()

// Create the apollo client
const apolloClient = new ApolloClient({
    link: httpLink,
    cache,
})

import Vue from 'vue'
import VueApollo from 'vue-apollo'

Vue.use(VueApollo)


export function createProvider() {
    return new VueApollo({
        defaultClient: apolloClient,
    });
}
