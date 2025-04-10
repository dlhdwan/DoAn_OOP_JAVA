
public class employees {
    private int EmployeeID;
    private String FullName;
    private String Role;
    private String Phonenumber;
    private String Salary;
    private int BranchID;

    public employees(int EmployeeID, String FullName, String Role, String Phonenumber, String Salary, int BranchID) {
        this.EmployeeID = EmployeeID;
        this.FullName = FullName;
        this.Role = Role;
        this.Phonenumber = Phonenumber;
        this.Salary = Salary;
        this.BranchID = BranchID;
    }
    public int getEmployeeID() {
        return EmployeeID;
    }
    public String getFullName() {
        return FullName;
    }
    public String getRole() {
        return Role;
    }
    public String getPhonenumber() {
        return Phonenumber;
    }
    public String getSalary() {
        return Salary;
    }
    public int getBranchID() {
        return BranchID;
    }
    @Override
    public String toString() {
        return "employees{" +
                "EmployeeID=" + EmployeeID +
                ", FullName='" + FullName + '\'' +
                ", Role='" + Role + '\'' +
                ", Phonenumber='" + Phonenumber + '\'' +
                ", Salary='" + Salary + '\'' +
                ", BranchID=" + BranchID +
                '}';
    }



}
