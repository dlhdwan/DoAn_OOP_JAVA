public class orderdetails {
    private int OrderDetailID;
    private int OrderID;
    private int MenuID;
    private int Quantity;
    private double Subtotal;

    public orderdetails(int OrderDetailID, int OrderID, int MenuID, int Quantity, double Subtotal) {
        this.OrderDetailID = OrderDetailID;
        this.OrderID = OrderID;
        this.MenuID = MenuID;
        this.Quantity = Quantity;
        this.Subtotal = Subtotal;
    }
    public int getOrderDetailID() {
        return OrderDetailID;
    }
    public int getOrderID() {
        return OrderID;
    }
    public int getMenuID() {
        return MenuID;
    }
    public int getQuantity() {
        return Quantity;
    }
    public double getSubtotal() {
        return Subtotal;
    }
    @Override
    public String toString() {
        return "orderdetails{" +
                "OrderDetailID=" + OrderDetailID +
                ", OrderID=" + OrderID +
                ", MenuID=" + MenuID +
                ", Quantity=" + Quantity +
                ", Subtotal=" + Subtotal +
                '}';
    }
}
