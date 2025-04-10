public class shifts {
    int ShiftID;
    String ShiftName;
    String StartTime;
    String EndTime;

    public shifts(int ShiftID, String ShiftName, String StartTime, String EndTime) {
        this.ShiftID = ShiftID;
        this.ShiftName = ShiftName;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
    }
    public int getShiftID() {
        return ShiftID;
    }
    public String getShiftName() {
        return ShiftName;
    }
    public String getStartTime() {
        return StartTime;
    }
    public String getEndTime() {
        return EndTime;
    }
    @Override
    public String toString() {
        return "shifts{" +
                "ShiftID=" + ShiftID +
                ", ShiftName='" + ShiftName + '\'' +
                ", StartTime='" + StartTime + '\'' +
                ", EndTime='" + EndTime + '\'' +
                '}';
    }
}
