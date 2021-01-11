<template>
  <v-card>
    <v-card-title>View User</v-card-title>
    <v-card-text v-if="!userLoading">
      <v-text-field
        v-model="getAccountById.username"
        label="Username"
      ></v-text-field>
      <v-text-field v-model="getAccountById.email" label="email"></v-text-field>
      <v-text-field v-model="getAccountById.bio" label="bio"></v-text-field>
      <v-btn @click="save(getAccountById.id)">Save Changes</v-btn>
    </v-card-text>
    <v-card v-else> Loading yo... </v-card>
  </v-card>
</template>


<script>
import { updateAccount, getAccount } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "ViewUser",
  computed: {
    ...mapGetters(["currentUser"]),
    userLoading() {
      return this.$apollo.queries.getAccountById.loading;
    },
  },
  data() {
    return {
      getAccountById: {},
    };
  },
  apollo: {
    getAccountById: {
      query: getAccount,
      variables() {
        return {
          id: this.currentUser.id,
        };
      },
    },
  },
  methods: {
    async save(id) {
      console.info(`Current user: ${JSON.stringify(this.currentUser.id)}`);
      let payload = {
        username: this.getAccountById.username,
        email: this.getAccountById.email,
        bio: this.getAccountById.bio,
        id: this.currentUser.id,
      };
      try {
        const response = await this.$apollo.mutate({
          mutation: updateAccount,
          variables: payload,
        });
        console.info(`Incoming response: ${JSON.stringify(response)}`);
        await this.$store.dispatch(
          "setCurrentUser",
          response.data.updateAccount
        );
        this.$apollo.queries.getAccountById.refetch();
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>