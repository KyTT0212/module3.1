package model;
//MOdel là nơi trung chuyển dữ liệu giữ servlet với view và ngược lại
public class UserModel {
    private String usesName;
    private String fullName;

    public UserModel() {
    }

    public UserModel(String usesName, String fullName) {
        this.usesName = usesName;
        this.fullName = fullName;
    }

    public String getUsesName() {
        return usesName;
    }

    public void setUsesName(String usesName) {
        this.usesName = usesName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
