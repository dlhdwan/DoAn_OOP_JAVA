public class employeeshifts {
    private int AssignmentID;
    private int EmployeeID;
    private int ShiftID;
    private String WorkDate;

    public employeeshifts(int AssignmentID, int EmployeeID, int ShiftID, String WorkDate) {
        this.AssignmentID = AssignmentID;
        this.EmployeeID = EmployeeID;
        this.ShiftID = ShiftID;
        this.WorkDate = WorkDate;
    }
    public int getAssignmentID() {
        return AssignmentID;
    }
    public int getEmployeeID() {
        return EmployeeID;
    }
    public int getShiftID() {
        return ShiftID;
    }
    public String getWorkDate() {
        return WorkDate;
    }
    @Override
    public String toString() {
        return "employeeshifts{" +
                "AssignmentID=" + AssignmentID +
                ", EmployeeID=" + EmployeeID +
                ", ShiftID=" + ShiftID +
                ", WorkDate='" + WorkDate + '\'' +
                '}';
    }
}
