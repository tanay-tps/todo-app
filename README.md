Following are routes to test the all API endpoints.

1) Registration
  POST "/users"
  Parameters: 
  `{ 
    "user": 
      {
      "email": "test@gmail.com",
      "password": "123456",
      "password_confirmation" : "123456"
      }
  }`

2) Login
  POST "/oauth/token"
  Parameters:
  `{  "email": "test@gmail.com",  "password": "123456",  "grant_type": "password"}`


Note: Please save token received after login and use that token in every request for Todo CRUD.

eg. Add this in header

  `Authorization: bearer received_token`

3) Index of personal todos

  GET "/todos/personal_list"


4) Index of collaborative todos

  GET "/todos/collaborative_list"

5) Create new todo
  POST "/todos"
  Parameters:
  `{ 
    "todo": 
      {
      "title": "test todo",
      "description": "This is the test description",
      "user_ids": [1,2,3]
      }
  }`

6) Details of todo
  GET "/todos/:id"

7) Update specific todo
  PATCH "/todos/:id"
  Parameters:
  `{ 
    "todo": 
      {
      "title": "test todo 2",
      "description": "test description update",
      "user_ids": [1,2,3]
      }
  }`



8) Delete specific post
  DELETE "/todos/:id"

9) Get Reset password link
  POST "/users/password"
  Parameters:
  `{  "email": "test@gmail.com"}`

10) Get Update password
  PATCH "/users/password"
  Parameters:
  `{
    "user": {
      "reset_password_token": "XGEq914VawuLL3ztFbM1",
      "password": "123456",
      "password_confirmation": "123456"
    }
  }`

To check the spec, please run following command:
`bundle exec rspec`