class UserApiAuthenticationCredentialController < ApplicationController
	 before_filter :authenticate_rest_call

 def check_redis_status
@posts = Post.all 
       render layout: false,text: @posts.to_json
 end

 private

 def authenticate_rest_call
  @api_user = UserApiAuthenticationCredential.where(user_name:request.headers['X-Api-UserName']).first 
  api_key = @api_user.token unless @api_user.nil?
  if request.headers['X-Api-Password'] == @api_user.password && api_key == request.headers['X-Api-Key'] && request.headers['X-Api-UserName'] == @api_user.user_name
   "OK"
  else
   head status: :unauthorized
   return false
  end
 end
end
