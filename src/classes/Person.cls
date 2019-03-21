public virtual class Person {
    
    // Fields
    private String name;
    private String email;
    
    
    // Constructors
    
    // Default Constructor
    public Person() {
    	System.debug('Hello Moto!');
        name = '';
        email = '';
    }
    
    public Person(String name) {
        this.name = name;
    }
    
    // Accessors or Getters
    
    public String getName() {
        // Check if user has permission
        return this.name;
    }
    
    public String getEmail() {
        // Check if user has permission
        return this.email;
    }
    
    // Mutators or Setters
    public void setName(String name) {
        this.name = name;
    }
    
    public void setEmail(String email) {
        // We use setters to validate the values we're setting
        this.email = email;
    }
    // Marking a method with virtual means that it CAN be overriden, but is
    // not required to be overriden.
    public virtual void display() {
        System.debug('Name: ' + this.name);
        System.debug('Email: ' + this.email);
    }
    
    
}