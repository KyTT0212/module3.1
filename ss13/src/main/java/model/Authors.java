package model;

public class Authors {
    private Integer id;
    private String name;

    public Authors(Integer authorsID, String authorsName) {
        this.id = authorsID;
        this.name= authorsName;
    }

    public Authors(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
