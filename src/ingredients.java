public class ingredients {
    private int IngredientID;
    private String Name;
    private String Unit;
    private double PricePerUnit;

    public ingredients(int IngredientID, String Name, String Unit, double PricePerUnit) {
        this.IngredientID = IngredientID;
        this.Name = Name;
        this.Unit = Unit;
        this.PricePerUnit = PricePerUnit;
    }
    public int getIngredientID() {
        return IngredientID;
    }
    public String getName() {
        return Name;
    }
    public String getUnit() {
        return Unit;
    }
    public double getPricePerUnit() {
        return PricePerUnit;
    }
    @Override
    public String toString() {
        return "ingredients{" +
                "IngredientID=" + IngredientID +
                ", Name='" + Name + '\'' +
                ", Unit='" + Unit + '\'' +
                ", PricePerUnit=" + PricePerUnit +
                '}';
    }

}
