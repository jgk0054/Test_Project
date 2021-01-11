<template>
  <v-card>
    <v-card-title>Register a new User </v-card-title>
    <v-card-text>
      <v-text-field v-model="username" hint="username here" label="username">
      </v-text-field>
      <v-text-field v-model="email" hint="email" label="email"> </v-text-field>
      <v-text-field v-model="bio" hint="Enter a bio here" label="bio">
      </v-text-field>
      <v-btn @click="createAccount"> Submit </v-btn>
    </v-card-text>
  </v-card>
</template>



<script>
import { createAccount } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "RegisterUser",
  computed: {
    ...mapGetters(["currentUser"]),
  },
  data() {
    return {
      username: "",
      email: "",
      bio: "",
    };
  },
  methods: {
    async createAccount() {
      try {
        const response = await this.$apollo.mutate({
          mutation: createAccount,
          variables: {
            username: this.username,
            email: this.email,
            bio: this.bio,
          },
        });
        console.info(`Incoming response: ${JSON.stringify(response)}`);
        await this.$store.dispatch(
          "setCurrentUser",
          response.data.createAccount
        );
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>