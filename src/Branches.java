class Branches {
    private int BrandID;
    private String Name;
    private String Address;
    private String Phonenumber;
    private int ManagerID;

    public Branches(int BrandID, String Name, String Address, String Phonenumber, int ManagerID) {
        this.BrandID = BrandID;
        this.Name = Name;
        this.Address = Address;
        this.Phonenumber = Phonenumber;
        this.ManagerID = ManagerID;
    }

    public int getBrandID() {
        return BrandID;
    }

    public int getManagerID() {
        return ManagerID;
    }

    public String getAddress() {
        return Address;
    }
    public String getName() {
        return Name;
    }
    public String getPhonenumber() {
        return Phonenumber;
    }
    @Override
    public String toString() {
        return "Branches{" +
                "BrandID=" + BrandID +
                ", Name='" + Name + '\'' +
                ", Address='" + Address + '\'' +
                ", Phonenumber='" + Phonenumber + '\'' +
                ", ManagerID=" + ManagerID +
                '}';
    }
}
