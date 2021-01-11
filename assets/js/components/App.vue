<template>
  <v-app id="app">
    <v-main>
      <v-container fluid>
        <v-row>
          <v-col sm="3">
            <the-side-menu />
          </v-col>
          <v-col sm="9">
            <div>
              <router-view />
            </div>
          </v-col>
        </v-row>
        <!-- <the-side-menu />
        <router-view /> -->
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import TheSideMenu from "./Navbar.vue";

export default {
  name: "app",
  components: {
    "the-side-menu": TheSideMenu,
  },
};
</script>