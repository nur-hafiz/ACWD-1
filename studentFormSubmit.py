#!/Python27/python
import cgi
import MySQLdb

form = cgi.FieldStorage()
DB = MySQLdb.connect("127.0.0.1",username,password,database)
DBCursor = DB.cursor()

#Retrieving userinputs into variables
firstName = form["firstName"].value
lastName = form["lastName"].value
resAddress = form["resAddress"].value
phoneNum = form["phoneNum"].value
gender = form["gender"].value
course = form["courseNames"].value
userInfo=[firstName,lastName,resAddress,phoneNum,gender,course]
infoSQL="" #String for insert statement SQL
for info in userInfo:
    infoSQL += "'%s'"%info
    if info != userInfo[len(userInfo)-1]:
        infoSQL += "," #Adds comma if not last item

htmlFile=open('formSubmit.html','r')
pageSubmit=htmlFile.read()
print ("Content-Type:text/html")
print ('\n<!DOCTYPE html>'+(pageSubmit)%(firstName))

try:
    DBCursor.execute("""INSERT INTO StudentMaster(
        Student_FirstName,Student_LastName,
        Residential_Address,PhoneNo,
        Gender,Course_Id)
        VALUES("""+infoSQL+")")
    DB.commit()

except:
    DB.rollback()

DBCursor.close()
del studentDBCursor
DB.close()
