#Melakukan import mysql connector
import mysql.connector

#Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host='localhost',
    port=3306,
    database='karyawan_db',
    user='afit_user',
    password='afit_pass'
)

#Membuat object cursor sebagai penanda
cursor = conn.cursor()

#Deklarasi SQL Query untuk memasukkan record ke DB (KARYAWAN)
insert_sql = (
    "INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) "
    "VALUES (%s, %s, %s, %s, %s)"
)


values = ('Afit', 'Santoso', 21, 'Male', 50000)

try:
    # Eksekusi SQL command
    cursor.execute(insert_sql, values)

    # Melakukan perubahan (commit) pada DB
    conn.commit()
    print("Record inserted successfully.")

except mysql.connector.Error as error:
    # Roll back apabila ada issue
    conn.rollback()
    print("Failed to insert record into MySQL table: {}".format(error))

finally:
    #Menutup koneksi
    cursor.close()
    conn.close()
