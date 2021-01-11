<template>
  <v-card>
    <v-card-title>Blog Posts</v-card-title>
    <v-card-text>
      <ul>
        <li v-for="item in allPosts" :key="item.id">
          <h3>{{item.title}}</h3>
          <p>{{item.body}}</p>
        </li>
      </ul>
    </v-card-text>
  </v-card>
</template>


<script>
import { getPosts } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "Blog",
  computed: {
    ...mapGetters(["currentUser"]),
  },

  data() {
    return {
      allPosts: [],
    };
  },
  apollo: {
    allPosts: {
      query: getPosts,
    },
  },
  methods: {},
};
</script>

