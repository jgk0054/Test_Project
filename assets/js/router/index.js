import Vue from 'vue';
import Router from 'vue-router'
import Home from '../components/Home'
import RegisterUser from '../components/RegisterUser'
import Blog from '../components/Blog'
import Users from '../components/Users'
import ViewUser from '../components/ViewUser'
import CreatePost from '../components/CreatePost'
import UserBlog from '../components/UserBlog'
import { store } from '../vuex/index'

Vue.use(Router)

const router = new Router({
    mode: 'history',
    linkActiveClass: 'is-active',
    scrollBehavior: (to, from, savedPosition) => ({ y: 0 }),
    routes: [
        {
            path: '/',
            name: 'Home',
            component: Home
        }, {
            path: '/Blog',
            name: 'Blog',
            component: Blog
        },{
            path: '/UserBlog',
            name: 'UserBlog',
            component: UserBlog
        }, {
            path: '/CreatePost',
            name: 'CreatePost',
            component: CreatePost
        }, {
            path: '/SignUp',
            name: 'Sign Up',
            component: RegisterUser
        }, {
            path: '/Users',
            name: 'Users',
            component: Users
        }, {
            path: '/ViewUser',
            name: 'ViewUser',
            component: ViewUser
        }
    ]
})

router.beforeEach((to, from, next) => {
    store.dispatch('restoreCurrentUser');
    next();
});


export default router
