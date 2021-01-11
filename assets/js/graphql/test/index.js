import gql from 'graphql-tag'

export const getLinks = gql`
    query{
        allLinks{
            description
            id
            url
        }  
    }`
// export const getLink = gql``

export const submitLink = gql`
mutation($url: String!, $description: String!) {
    createLink(
      url: $url,
      description: $description,
    ) {
      id
      url
      description
    }
  }`

export const deleteLink = gql`
mutation($id: String!){
    deleteLink(id: $id){
      description,
      url
    }
  }`

export const createAccount = gql`
mutation($username: String!, $email: String!, $bio: String!){
  createAccount(bio: $bio, username: $username, email: $email){
    id
    username
    email
    bio
  }
}`
export const getAccounts = gql`
query{
  allAccounts{
    id
    username
    email
    bio
  }
}`
export const getAccount = gql`
query($id: String!){
  getAccountById(id: $id){
    id
    username
    email
    bio
  }
}`
export const getAccountByEmail = gql`
query($email: String!){
  getAccountsByEmail(email: $email){
    id
    username
    bio
    email
  }
}`
export const getAccountByUserName = gql`
query($username: String!){
  getAccountByUsername(username: $username){
    id
    username
    bio
    email
  }
}`

export const updateAccount = gql`
mutation($username: String!, $email: String!, $bio: String!, $id: String!){
  updateAccount(bio: $bio, username: $username, email: $email, id: $id){
    id
    username
    email
    bio
  }
}`
export const deleteAccount = gql`
mutation($id: String!){
  deleteAccount(id: $id){
    username,
    id,
    email,
    bio
  }
}`


export const getPosts = gql`
query{
  allPosts{
    body,
    id,
    title,
    userId
  }
}`

export const getPostsByUserId = gql`
query($userId: ID!){
  getPostsByUserId(userId: $userId){
    title
    id
    body
    userId
  }
}`

export const createPost = gql`
 mutation($userId: ID!, $title: String!, $body: String!){
   createPost(userId: $userId, title: $title, body: $body){
     id
     body
     title
     userId
   }
 }`