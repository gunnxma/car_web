if @user
	json.result "success"
	json.code @code
else
	json.result "error"
end