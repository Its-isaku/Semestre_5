class DatabaseConnection:
    _instance = None
    
    def __new__(cls):
        #! This is the key part of the Singleton pattern
        if cls._instance is None:
            #* Create the instance only if it doesn't exist yet
            cls._instance = super(DatabaseConnection, cls).__new__(cls)
            #* Initialize the instance
            cls._instance._initialized = False
        return cls._instance
    
    def __init__(self):
        #? Initialization method that runs only once
        if self._initialized:
            return
        
        #* Setting up the database connection (simulated)
        self.host = "localhost"
        self.user = "admin"
        self.password = "password"
        self.database = "example_db"
        self.connection_id = id(self)
        self._initialized = True
        
    def connect(self):
        #* Method to simulate database connection
        return f"Connected to {self.database} at {self.host} (Connection ID: {self.connection_id})"
    
    def execute_query(self, query):
        #* Method to simulate query execution
        return f"Executing query: {query} (Connection ID: {self.connection_id})"


#? Example usage
if __name__ == "__main__":
    #? First instance creation
    print("Creating first database connection...")
    db1 = DatabaseConnection()
    print(db1.connect())
    
    #? Second instance - should be the same as the first one
    print("\nCreating second database connection...")
    db2 = DatabaseConnection()
    print(db2.connect())
    
    #? Proof that both variables refer to the same instance
    print("\nAre db1 and db2 the same instance?", db1 is db2)
    
    #? Modifying the instance through one reference affects the other
    print("\nChanging database name through db1...")
    db1.database = "new_database"
    print("db1 database:", db1.database)
    print("db2 database:", db2.database)  # Should also be "new_database"
    
    #? Using the instance
    print("\nExecuting queries...")
    print(db1.execute_query("SELECT * FROM users"))
    print(db2.execute_query("INSERT INTO users VALUES ('John', 'Doe')"))
