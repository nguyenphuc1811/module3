import java.util.Date;

public class Customer {
    private String name;
    private Date date;
    private String address;
    private String linkPicture;

    public Customer() {
    }

    public Customer(String name, Date date, String address, String linkPicture) {
        this.name = name;
        this.date = date;
        this.address = address;
        this.linkPicture = linkPicture;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLinkPicture() {
        return linkPicture;
    }

    public void setLinkPicture(String linkPicture) {
        this.linkPicture = linkPicture;
    }
}

