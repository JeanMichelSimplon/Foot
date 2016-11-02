del Foot.war
rd /s /q temp
md temp
xcopy /E src\main\webapp\* temp
jar cvf Foot.war -C temp .
rem xcopy *.war C:\"Program Files"\"Apache Software Foundation"\"Tomcat 8.5"\webapps /C /R /Y