import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const initialState = {
  currentUser: null
}

export const store = new Vuex.Store({
  state: initialState,
  getters: {
    currentUser: state => state.currentUser,
  },
  actions: {
    setCurrentUser(context, user) {
      console.info(`Store here, we got the following context: ${JSON.stringify(context)} user: ${JSON.stringify(user)}`);
      context.commit('currentUserSet', user)
    },

    restoreCurrentUser(context) {
      if (context.getters.currentUser) {
        return true
      }

      const user = window.localStorage.getItem('currentUser')
      if (user) {
        context.commit('currentUserRestored', JSON.parse(user))
        return true
      } else {
        context.commit('currentUserRemoved')
        return false
      }
    },

    removeCurrentUser(context) {
      context.commit('currentUserRemoved');
    }
  },
  mutations: {
    currentUserSet(state, user) {
      window.localStorage.setItem('currentUser', JSON.stringify(user))
      state.currentUser = user
    },
    currentUserRestored(state, user) {
      state.currentUser = user
    },
    currentUserRemoved(state) {
      window.localStorage.setItem('currentUser', null)
      state.currentUser = null
    }
  }
})