public class customers {
    private int CustomerID;
    private String FullName;
    private String PhoneNumber;
    private int LoyaltyPoints;

    public customers(int CustomerID, String FullName, String PhoneNumber, int LoyaltyPoints) {
        this.CustomerID = CustomerID;
        this.FullName = FullName;
        this.PhoneNumber = PhoneNumber;
        this.LoyaltyPoints = LoyaltyPoints;
    }
    public int getCustomerID() {
        return CustomerID;
    }
    public String getFullName() {
        return FullName;
    }
    public String getPhoneNumber() {
        return PhoneNumber;
    }
    public int getLoyaltyPoints() {
        return LoyaltyPoints;
    }
    @Override
    public String toString() {
        return "customers{" +
                "CustomerID=" + CustomerID +
                ", FullName='" + FullName + '\'' +
                ", PhoneNumber='" + PhoneNumber + '\'' +
                ", LoyaltyPoints=" + LoyaltyPoints +
                '}';
    }

}
