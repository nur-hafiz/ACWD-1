#!/Python27/python
import MySQLdb

studentFormDB = MySQLdb.connect("127.0.0.1",username,password,database)
studentFormCursor = studentFormDB.cursor()

#Getting all rows of courses, iterating them into a string
studentFormCursor.execute("SELECT * FROM CourseMaster")
courses = studentFormCursor.fetchall()
courseDropList = ''
for course in courses:
    courseDropList+=("<option value='"+course[0]+"'>"+course[1]+"</option>")

htmlFile = open('formExtract.html','r')
form = htmlFile.read()
print ("Content-Type:text/html")
print('\n<!DOCTYPE html>'+(form)%(courseDropList))


#Don't move this up
studentFormCursor.close()
del studentFormCursor
studentFormDB.close()
htmlFile.close()
