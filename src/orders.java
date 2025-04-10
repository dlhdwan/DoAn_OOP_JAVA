public class orders {
    private int OrderID;
    private int CustomerID;
    private int EmployeeID;
    private int BranchID;
    private String OrderDate;
    private int TotalAmount;
    private String Status;

    public orders(int OrderID, int CustomerID, int EmployeeID, int BranchID, String OrderDate, int TotalAmount, String Status) {
        this.OrderID = OrderID;
        this.CustomerID = CustomerID;
        this.EmployeeID = EmployeeID;
        this.BranchID = BranchID;
        this.OrderDate = OrderDate;
        this.TotalAmount = TotalAmount;
        this.Status = Status;
    }
    public int getOrderID() {
        return OrderID;
    }
    public int getCustomerID() {
        return CustomerID;
    }
    public int getEmployeeID() {
        return EmployeeID;
    }
    public int getBranchID() {
        return BranchID;
    }
    public String getOrderDate() {
        return OrderDate;
    }
    public int getTotalAmount() {
        return TotalAmount;
    }
    public String getStatus() {
        return Status;
    }
    @Override
    public String toString() {
        return "orders{" +
                "OrderID=" + OrderID +
                ", CustomerID=" + CustomerID +
                ", EmployeeID=" + EmployeeID +
                ", BranchID=" + BranchID +
                ", OrderDate='" + OrderDate + '\'' +
                ", TotalAmount=" + TotalAmount +
                ", Status='" + Status + '\'' +
                '}';
    }
}
