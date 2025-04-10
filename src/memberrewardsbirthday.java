public class memberrewardsbirthday {
    private int customerID;
    private String MembershipLevel;
    private int Points;
    private String RegisteredDate;
    private String RewardDescription;
    private String ExpiryDate;

    public memberrewardsbirthday(int customerID, String MembershipLevel, int Points, String RegisteredDate, String RewardDescription, String ExpiryDate) {
        this.customerID = customerID;
        this.MembershipLevel = MembershipLevel;
        this.Points = Points;
        this.RegisteredDate = RegisteredDate;
        this.RewardDescription = RewardDescription;
        this.ExpiryDate = ExpiryDate;
    }
    public int getCustomerID() {
        return customerID;
    }
    public String getMembershipLevel() {
        return MembershipLevel;
    }
    public int getPoints() {
        return Points;
    }
    public String getRegisteredDate() {
        return RegisteredDate;
    }
    public String getRewardDescription() {
        return RewardDescription;
    }
    public String getExpiryDate() {
        return ExpiryDate;
    }
    @Override
    public String toString() {
        return "memberrewardsbirthday{" +
                "customerID=" + customerID +
                ", MembershipLevel='" + MembershipLevel + '\'' +
                ", Points=" + Points +
                ", RegisteredDate='" + RegisteredDate + '\'' +
                ", RewardDescription='" + RewardDescription + '\'' +
                ", ExpiryDate='" + ExpiryDate + '\'' +
                '}';
    }

}
