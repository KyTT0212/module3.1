package model;

public class ListStudent {
    private Integer maHV;
    private String name;
    private Integer gioiTinh;
    private Double diem;

    public ListStudent() {
    }

    public ListStudent(String name, Integer gioiTinh, Double diem) {
        this.name = name;
        this.gioiTinh = gioiTinh;
        this.diem = diem;
    }

    public ListStudent(Integer maHV, String name, Integer gioiTinh, Double diem) {
        this.maHV = maHV;
        this.name = name;
        this.gioiTinh = gioiTinh;
        this.diem = diem;
    }

    public Integer getMaHV() {
        return maHV;
    }

    public void setMaHV(Integer maHV) {
        this.maHV = maHV;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(Integer gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Double getDiem() {
        return diem;
    }

    public void setDiem(Double diem) {
        this.diem = diem;
    }
}
