public class menu {
    private int MenuID;
    private String Name;
    private String Category;
    private double Price;

    public menu(int MenuID, String Name, String Category, double Price) {
        this.MenuID = MenuID;
        this.Name = Name;
        this.Category = Category;
        this.Price = Price;
    }
    public int getMenuID() {
        return MenuID;
    }
    public String getName() {
        return Name;
    }
    public String getCategory() {
        return Category;
    }
    public double getPrice() {
        return Price;
    }
    @Override
    public String toString() {
        return "menu{" +
                "MenuID=" + MenuID +
                ", Name='" + Name + '\'' +
                ", Category='" + Category + '\'' +
                ", Price='" + Price + '\'' +
                '}';
    }
}
