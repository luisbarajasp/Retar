if @update_attr
    json.update true
else
    json.username @user.username
    json.token @authentication_token.token
end