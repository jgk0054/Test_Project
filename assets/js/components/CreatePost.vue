<template>
  <v-card>
    <v-card-title>Create a Blog Post</v-card-title>
    <v-card-text>
      <v-text-field v-model="title" label="Title"></v-text-field>
      <v-text-field v-model="body" label="Body"></v-text-field>
      <v-btn @click="createPost">Create</v-btn>
    </v-card-text>
  </v-card>
</template>


<script>
import { createPost } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "CreatePost",
  computed: {
    ...mapGetters(["currentUser"]),
  },

  data() {
    return {
      title: "",
      body: "",
    };
  },
  methods: {
    async createPost() {
      console.info(this.currentUser.id);
      try {
        const response = await this.$apollo.mutate({
          mutation: createPost,
          variables: {
            title: this.title,
            body: this.body,
            userId: this.currentUser.id,
          },
        });
        console.info(`Incoming response: ${JSON.stringify(response)}`);
        alert("created");
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

