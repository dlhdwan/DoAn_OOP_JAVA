
public class branchingredients {
    private int branchIngredientID;
    private int branchID;
    private int ingredientID;
    private String LastUpdated;

    public branchingredients(int branchIngredientID, int branchID, int ingredientID, String LastUpdated) {
        this.branchIngredientID = branchIngredientID;
        this.branchID = branchID;
        this.ingredientID = ingredientID;
        this.LastUpdated = LastUpdated;
    }
    public int getBranchIngredientID() {
        return branchIngredientID;
    }
    public int getBranchID() {
        return branchID;
    }
    public int getIngredientID() {
        return ingredientID;
    }
    public String getLastUpdated() {
        return LastUpdated;
    }
    @Override
    public String toString() {
        return "branchingredients{" +
                "branchIngredientID=" + branchIngredientID +
                ", branchID=" + branchID +
                ", ingredientID=" + ingredientID +
                ", LastUpdated=" + LastUpdated +
                '}';
    }
}
