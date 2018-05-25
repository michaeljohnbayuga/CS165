cd valid_login_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/valid_login_test
robot valid_login.robot
google-chrome log.html
cd ..

cd invalid_login_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/invalid_login_test
robot invalid_login.robot
google-chrome log.html
cd ..

cd valid_signup_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/valid_signup_test
robot valid_signup.robot
google-chrome log.html
cd ..

cd invalid_signup_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/invalid_signup_test
robot invalid_signup.robot
google-chrome log.html
cd ..

#cd rate_test
#export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/rate_test
#robot rate.robot
#google-chrome log.html
#cd ..

cd favorite_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/favorite_test
robot favorite.robot
google-chrome log.html
cd ..

#cd review_test
#export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/review_test
#robot review.robot
#google-chrome log.html
#cd ..

cd valid_show
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/valid_show
robot valid_show.robot
google-chrome log.html
cd ..