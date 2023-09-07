//
//  SqlDbManager.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 28/07/22.
//

import Foundation
import SQLite3

class SqlDbManager {
    
    private let dbPath: String = Constants.dbPathConstant
    
    // represent the current cursor pointer
    private var db: OpaquePointer?
    
    // Creating class instance inside self class, called Singleton class. which only one instance of class exists
    static let sharedInstance = SqlDbManager() //
    
    private init() {
        db = openDatabase()
        createDetailsTable()
    }
    
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        
        print(fileURL, "This is the fileURL")
        
        var db: OpaquePointer? = nil
        
        //This function calls sqlite3_open(), which opens or creates a new database file. If it’s successful, it returns an OpaquePointer, which is a Swift type for C pointers.
        
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK { //SQLITE_OK is the result code
            print("Successfully opened connection to database at \(dbPath)")
            return db
        } else {
            print("error opening database")
            return nil
        }
    }
    
    func createDetailsTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS detail(id INTEGER PRIMARY KEY, name TEXT, mail TEXT UNIQUE, mobile TEXT,password TEXT, address TEXT, state TEXT, pincode TEXT );"
        
        var createTableStatement: OpaquePointer? = nil
        
        //sqlite3_prepare_v2() compiles the SQL statement into byte code and returns a status code — an important step before executing arbitrary statements against your database.
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            //runs the compiled statement.
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        
        //You must always call sqlite3_finalize() on your compiled statement to delete it and avoid resource leaks. Once a statement finalizes, you should never use it again.
        sqlite3_finalize(createTableStatement)
    }
    
    func insert( userDetails user : UserDetails) {
        guard let name = user.name, let password = user.password, let mail = user.mail, let mobile = user.mobile, let address = user.address, let state = user.state, let pincode = user.pincode else { return}
        let insertStatementString = "INSERT INTO detail (id, name, mail, mobile, password, address, state, pincode) VALUES (NULL, ?, ?, ?, ?, ?, ?,?);"
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            //binding  property
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (mail as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (mobile as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (state as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, (pincode as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [UserDetails] {
        let queryStatementString = "SELECT * FROM detail;"
        var queryStatement: OpaquePointer? = nil
        
        var details: [UserDetails] = []
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW { //at last we will get SQLITE_DONE status code
                
                let id = sqlite3_column_int(queryStatement, 0)
                
                let name = String(cString: sqlite3_column_text(queryStatement, 1)!)
                
                let mail = String(cString: sqlite3_column_text(queryStatement, 2)!)
                
                let mobile = String(cString: sqlite3_column_text(queryStatement, 3)!)
                
                let password = String(cString: sqlite3_column_text(queryStatement, 4)!)

                let address = String(cString: sqlite3_column_text(queryStatement, 5)!)
                
                let state = String(cString: sqlite3_column_text(queryStatement, 6)!)
                
                let pincode = String(cString: sqlite3_column_text(queryStatement, 7)!)
                details.append(UserDetails(id: Int(id), name: name, address: address, mail: mail, mobile: mobile, password: password, pincode: pincode, state: state ))
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return details
    }
    
    func update(Name:String, Mobile:Int64, Email: String) {
        let updateStatementStirng = "UPDATE detail set Name = '\(Name)' AND Mobile = '\(Mobile) WHERE Email = '\(Email)';"
        var updateStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, updateStatementStirng, -1, &updateStatement, nil) == SQLITE_OK {
            //binding data into delete statement
            sqlite3_bind_text(updateStatement, 1, (Email as NSString).utf8String, -1, nil)
            //SQLITE_DONE -> status message
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not updated row.")
            }
        } else {
            print("UPDATE statement could not be prepared")
        }
        
        //release resources to avoid memory leak
        sqlite3_finalize(updateStatement)
    }
    
    func delete(id : Int) {
        let deleteStatementString = "DELETE FROM detail WHERE id = ?;"
        var deleteStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            //binding data into delete statement
           sqlite3_bind_int(deleteStatement, 1, Int32(id))
            //SQLITE_DONE -> status message
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        //release resources to avoid memory leak
        sqlite3_finalize(deleteStatement)
    }
    
    func isValid(mail:String, password:String){
        let querry = "SELECT mail, password FROM detail WHERE mail = ?;"
        var validStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, querry, -1, &validStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(validStatement, 1, (mail as NSString).utf8String, -1, nil)
            while sqlite3_step(validStatement) == SQLITE_DONE{
                let Mail = String(cString: sqlite3_column_text(validStatement, 0)!)
                let Password = String(cString: sqlite3_column_text(validStatement, 1)!)
                print("true")
                print(Mail, Password)
            }
            
        }
        else{
            print("false")
            
        }
        sqlite3_finalize(validStatement)
    }
}
