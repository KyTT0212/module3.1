package model;

public class Books {
    private Integer id;
    private String name;
    private Integer pageSize;
//    private Authors authors;
//    private Category category;
private Integer authors;
private Integer category;
    public Books() {
    }

    public Books(Integer id, String name, Integer pageSize, Integer authors, Integer category) {
        this.id = id;
        this.name = name;
        this.pageSize = pageSize;
        this.authors = authors;
        this.category = category;
    }
//    public Books(Integer id, String name, Integer pageSize, Authors authors, Category category) {
//        this.id = id;
//        this.name = name;
//        this.pageSize = pageSize;
//        this.authors = authors;
//        this.category = category;
//    }

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

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

//    public Authors getAuthors() {
//        return authors;
//    }
//
//    public void setAuthors(Authors authors) {
//        this.authors = authors;
//    }
//
//    public Category getCategory() {
//        return category;
//    }
//
//    public void setCategory(Category category) {
//        this.category = category;
//    }

    public Integer getAuthors() {
        return authors;
    }

    public void setAuthors(Integer authors) {
        this.authors = authors;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }
}
