<template>
  <v-card>
    <v-card-title>Blog Posts From {{ currentUser.username }}</v-card-title>
    <v-card-text>
      <ul>
        <li v-for="item in getPostsByUserId" :key="item.id">
          <h3>{{ item.title }}</h3>
          <p>{{ item.body }}</p>
        </li>
      </ul>
    </v-card-text>
  </v-card>
</template>


<script>
import { getPostsByUserId } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "UserBlog",
  computed: {
    ...mapGetters(["currentUser"]),
  },

  data() {
    return {
      getPostsByUserId: [],
    };
  },
  apollo: {
    getPostsByUserId: {
      query: getPostsByUserId,
      variables() {
        return {
          userId: this.currentUser.id,
        };
      },
    },
  },
  methods: {},
};
</script>

