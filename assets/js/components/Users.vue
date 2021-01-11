<template>
  <v-card>
    <v-card-title> Select User! </v-card-title>
    <v-card-text>
      <ul>
        <li v-for="item in allAccounts" :key="item.id">
          {{ item.username + " " + item.email }}
          <v-btn @click="selectUser(item)">Select this user </v-btn>
          <v-btn @click="deleteAccount(item.id)">Delete</v-btn>
        </li>
      </ul>
    </v-card-text>
  </v-card>
</template>



<script>
import { getAccounts } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "Users",
  computed: {
    ...mapGetters(["currentUser"]),
  },

  data() {
    return {
      allAccounts: [],
    };
  },
  apollo: {
    allAccounts: {
      query: getAccounts,
    },
  },
  methods: {
    deleteAccount(id) {
      console.info(id);
    },
    selectUser(user) {
      console.info(user);
      this.$store.dispatch("setCurrentUser", user);
    },
  },
};
</script>

