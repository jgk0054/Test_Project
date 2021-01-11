<template>
  <v-navigation-drawer absolute permanent>
    <template v-slot:prepend>
      <v-list>
        <v-list-item-group>
          <v-subheader>My Crappy Website</v-subheader>
          <v-list-item color="blue-grey" router to="/">
            <v-list-item-icon>
              <v-icon>mdi-label</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Home </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item color="blue-grey" router to="/Blog">
            <v-list-item-icon>
              <v-icon>mdi-fire</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Blog </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item color="blue-grey" router to="/UserBlog">
            <v-list-item-icon>
              <v-icon>mdi-fire</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> User Blog </v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-list-item color="blue-grey" router to="/CreatePost">
            <v-list-item-icon>
              <v-icon>mdi-fire</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Create new Blog Post </v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-list-item color="blue-grey" router to="/Users">
            <v-list-item-icon>
              <v-icon>mdi-fire</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> View Users </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item color="blue-grey" router to="/ViewUser">
            <v-list-item-icon>
              <v-icon>mdi-fire</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> View User </v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-list-item color="blue-grey" router to="/SignUp">
            <v-list-item-icon>
              <v-icon>mdi-account-plus</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title> Sign Up! </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </template>
  </v-navigation-drawer>
</template>

<style lang="scss" scoped>
aside {
  border-right: 1px solid #b5b5b5;
  min-width: 240px;
}
</style>
