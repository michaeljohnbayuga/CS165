cd valid_login_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/valid_login_test
robot valid_login.robot
google-chrome report.html
cd ..
cd invalid_login_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/invalid_login_test
robot invalid_login.robot
google-chrome report.html
cd ..
cd valid_signup_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/valid_signup_test
robot valid_signup.robot
google-chrome report.html
cd ..
cd invalid_signup_test
export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/invalid_signup_test
robot invalid_signup.robot
google-chrome report.html
cd ..
#cd rate_test
#export PATH=$PATH:/home/julius/Desktop/korean-drama-db-team-kddb/robot_tests/rate_test
#robot rate.robot
#google-chromium report.html
#cd ..