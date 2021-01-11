<template>
  <div class="vue-message">
    <ul>
      <li v-for="item in allLinks" :key="item.id">
        {{ item.description + " " + item.url }}
        <v-btn @click="deleteLink(item.id)">Delete</v-btn>
      </li>
    </ul>
    <br />
    <hr />
    <span> Submit a new link </span>
    <v-text-field v-model="url" hint="Enter a URL here" label="URL">
    </v-text-field>

    <v-text-field
      v-model="description"
      hint="Enter a description"
      label="Description"
    >
    </v-text-field>

    <v-btn @click="submitNewLink"> Submit </v-btn>
  </div>
</template>

<script>
import { getLinks, submitLink, deleteLink } from "../graphql/test/index.js";
import { mapGetters } from "vuex";

export default {
  name: "Home",
  computed: {
    ...mapGetters(["currentUser"]),
  },

  data() {
    return {
      allLinks: [],
      url: "",
      description: "",
    };
  },
  apollo: {
    allLinks: {
      query: getLinks,
    },
  },
  methods: {
    async submitNewLink() {
      try {
        const response = await this.$apollo.mutate({
          mutation: submitLink,
          variables: {
            url: this.url,
            description: this.description,
          },
        });
        this.$apollo.queries.allLinks.refetch();
      } catch (error) {
        console.error(error);
      }
    },

    async deleteLink(id) {
      try {
        const response = await this.$apollo.mutate({
          mutation: deleteLink,
          variables: {
            id: id,
          },
        });
        this.$apollo.queries.allLinks.refetch();
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

