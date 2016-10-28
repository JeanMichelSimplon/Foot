del Foot.war
rd /s /q temp
md temp
xcopy /E src\main\webapp\* temp
jar cvf Foot.war -C temp .