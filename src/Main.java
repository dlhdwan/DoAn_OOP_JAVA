//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Main {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/phuclongcoffeeandtea";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "dlhdwan";
    private static List<Branches> branchesList;
    private static List<branchingredients> branchingredientsList;
    private static List<employees> employeesList;
    private static List<customers> customersList;
    private static List<employeeshifts> empshiftsList;
    private static List<ingredients> ingredientsList;
    private static List<shifts> shiftsList;
    private static List<memberrewardsbirthday> memberrewardsbirthdayList;
    private static List<menu> menuList;
    private static List<orders> ordersList;
    private static List<orderdetails> orderdetailsList;
    public static Connection connection;

    public Main() {
    }

    public static void main(String[] args) {
        branchesList = new ArrayList();
        branchingredientsList = new ArrayList();
        employeesList = new ArrayList();
        customersList = new ArrayList();
        empshiftsList = new ArrayList();
        ingredientsList = new ArrayList();
        shiftsList = new ArrayList();
        memberrewardsbirthdayList = new ArrayList();
        menuList = new ArrayList();
        ordersList = new ArrayList();
        orderdetailsList = new ArrayList();

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/phuclongcoffeeandtea", "root", "dlhdwan");
            add_data();
            Cau1();
            System.out.println("-------------------------------------------------");
            Cau2();
            System.out.println("-------------------------------------------------");
            Cau3();
            System.out.println("-------------------------------------------------");
            Cau4();
            System.out.println("-------------------------------------------------");
            Cau5();
            System.out.println("-------------------------------------------------");
            Cau6();
            System.out.println("-------------------------------------------------");
            Cau7();
            System.out.println("-------------------------------------------------");
            Cau8();
            System.out.println("-------------------------------------------------");
            Cau9();
            System.out.println("-------------------------------------------------");
            Cau10();
            System.out.println("-------------------------------------------------");
            Cau11();
            System.out.println("-------------------------------------------------");
            Cau12();
            System.out.println("-------------------------------------------------");
            Cau13();
            System.out.println("-------------------------------------------------");
            Cau14();
            System.out.println("-------------------------------------------------");
            Cau15();
            System.out.println("-------------------------------------------------");
            Cau16();
            System.out.println("-------------------------------------------------");
            Cau17();
            System.out.println("-------------------------------------------------");
            Cau18();
            System.out.println("-------------------------------------------------");
            Cau19();
            System.out.println("-------------------------------------------------");
            Cau20();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    static void add_data() throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet databranches = statement.executeQuery("SELECT * FROM branches");

        while(databranches.next()) {
            branchesList.add(new Branches(databranches.getInt("BranchID"), databranches.getString("Name"), databranches.getString("Address"), databranches.getString("PhoneNumber"), databranches.getInt("ManagerID")));
        }

        ResultSet databranchingredients = statement.executeQuery("SELECT * FROM branchingredients");

        while(databranchingredients.next()) {
            branchingredientsList.add(new branchingredients(databranchingredients.getInt("BranchIngredientID"), databranchingredients.getInt("BranchID"), databranchingredients.getInt("IngredientID"), databranchingredients.getString("LastUpdated")));
        }

        ResultSet dataemployees = statement.executeQuery("SELECT * FROM employees");

        while(dataemployees.next()) {
            employeesList.add(new employees(dataemployees.getInt("EmployeeID"), dataemployees.getString("FullName"), dataemployees.getString("Role"), dataemployees.getString("Phonenumber"), dataemployees.getString("Salary"), dataemployees.getInt("BranchID")));
        }

        ResultSet dâatacustomers = statement.executeQuery("SELECT * FROM customers");

        while(dâatacustomers.next()) {
            customersList.add(new customers(dâatacustomers.getInt("CustomerID"), dâatacustomers.getString("FullName"), dâatacustomers.getString("PhoneNumber"), dâatacustomers.getInt("LoyaltyPoints")));
        }

        ResultSet dataempshifts = statement.executeQuery("SELECT * FROM employeeshifts");

        while(dataempshifts.next()) {
            empshiftsList.add(new employeeshifts(dataempshifts.getInt("AssignmentID"), dataempshifts.getInt("EmployeeID"), dataempshifts.getInt("ShiftID"), dataempshifts.getString("WorkDate")));
        }

        ResultSet dataingredients = statement.executeQuery("SELECT * FROM ingredients");

        while(dataingredients.next()) {
            ingredientsList.add(new ingredients(dataingredients.getInt("IngredientID"), dataingredients.getString("Name"), dataingredients.getString("Unit"), (double)dataingredients.getInt("PricePerUnit")));
        }

        ResultSet datashifts = statement.executeQuery("SELECT * FROM shifts");

        while(datashifts.next()) {
            shiftsList.add(new shifts(datashifts.getInt("ShiftID"), datashifts.getString("ShiftName"), datashifts.getString("StartTime"), datashifts.getString("EndTime")));
        }

        ResultSet datamemberrewardsbirthday = statement.executeQuery("SELECT * FROM memberrewardsbirthday");

        while(datamemberrewardsbirthday.next()) {
            memberrewardsbirthdayList.add(new memberrewardsbirthday(datamemberrewardsbirthday.getInt("CustomerID"), datamemberrewardsbirthday.getString("MembershipLevel"), datamemberrewardsbirthday.getInt("Points"), datamemberrewardsbirthday.getString("RegisteredDate"), datamemberrewardsbirthday.getString("RewardDescription"), datamemberrewardsbirthday.getString("ExpiryDate")));
        }

        ResultSet datamenu = statement.executeQuery("SELECT * FROM menu");

        while(datamenu.next()) {
            menuList.add(new menu(datamenu.getInt("MenuID"), datamenu.getString("Name"), datamenu.getString("Category"), (double)datamenu.getInt("Price")));
        }

        ResultSet dataorders = statement.executeQuery("SELECT * FROM orders");

        while(dataorders.next()) {
            ordersList.add(new orders(dataorders.getInt("OrderID"), dataorders.getInt("CustomerID"), dataorders.getInt("EmployeeID"), dataorders.getInt("BranchID"), dataorders.getString("OrderDate"), dataorders.getInt("TotalAmount"), dataorders.getString("Status")));
        }

        ResultSet dataorderdetails = statement.executeQuery("SELECT * FROM orderdetails");

        while(dataorderdetails.next()) {
            orderdetailsList.add(new orderdetails(dataorderdetails.getInt("OrderDetailID"), dataorderdetails.getInt("OrderID"), dataorderdetails.getInt("MenuID"), dataorderdetails.getInt("Quantity"), (double)dataorderdetails.getInt("Subtotal")));
        }

    }

    static void Cau1() {
        System.out.println("Câu 1: In ra tổng doanh thu từng chi nhánh");

        for(Branches branch : branchesList) {
            int total = ordersList.stream().filter((order) -> order.getBranchID() == branch.getBrandID()).mapToInt(orders::getTotalAmount).sum();
            PrintStream var10000 = System.out;
            String var10001 = branch.getName();
            var10000.println(var10001 + ": " + total);
        }

    }

    static void Cau2() {
        System.out.println("Câu 2: In ra danh sách các món ăn được đặt hàng nhiều nhất");
        Map<Integer, Integer> menuCount = (Map)orderdetailsList.stream().collect(Collectors.groupingBy(orderdetails::getMenuID, Collectors.summingInt(orderdetails::getQuantity)));
        int max = (Integer)menuCount.values().stream().max(Integer::compareTo).get();
        menuCount.forEach((menuID, count) -> {
            if (count == max) {
                menu menu = (menu)menuList.stream().filter((m) -> m.getMenuID() == menuID).findFirst().get();
                PrintStream var10000 = System.out;
                String var10001 = menu.getName();
                var10000.println(var10001 + ": " + count);
            }

        });
    }

    static void Cau3() {
        System.out.println("Câu 3: Tìm tất cả các nhân viên làm việc trong ít nhất 2 ca khác nhau");
        Stream var10000 = employeesList.stream().filter((emp) -> empshiftsList.stream().filter((es) -> es.getEmployeeID() == emp.getEmployeeID()).map(employeeshifts::getShiftID).distinct().count() >= 2L);
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }

    static void Cau4() {
        System.out.println("Câu 4: Liệt kê các khách hàng có số điểm tích lũy trên 200 và đã thực hiện ít nhất 1 đơn hàng");
        Stream var10000 = customersList.stream().filter((cust) -> cust.getLoyaltyPoints() > 200 && ordersList.stream().anyMatch((order) -> order.getCustomerID() == cust.getCustomerID()));
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }

    static void Cau5() {
        System.out.println("Câu 5: Tìm danh sách các sản phẩm thuộc danh mục 'Cà phê' được đặt hàng nhiều nhất trong tháng 12/2024");
        Map<Integer, Long> productCount = (Map)orderdetailsList.stream().filter((od) -> ordersList.stream().anyMatch((order) -> order.getOrderID() == od.getOrderID() && order.getOrderDate().startsWith("2024-12"))).filter((od) -> menuList.stream().anyMatch((menu) -> menu.getMenuID() == od.getMenuID() && menu.getCategory().equalsIgnoreCase("Cà phê"))).collect(Collectors.groupingBy(orderdetails::getMenuID, Collectors.summingLong(orderdetails::getQuantity)));
        productCount.forEach((productID, count) -> {
            String productName = (String)menuList.stream().filter((menu) -> menu.getMenuID() == productID).map(menu::getName).findFirst().orElse("Unknown Product");
            System.out.printf("Product: %s, Quantity: %d%n", productName, count);
        });
    }

    static void Cau6() {
        System.out.println("Câu 6: Tính tổng số lượng nguyên liệu được cập nhật lần cuối trong tháng 12/2024 tại mỗi chi nhánh");
        Map<Integer, Long> ingredientCountByBranch = (Map)branchingredientsList.stream().filter((bi) -> bi.getLastUpdated().startsWith("2024-12")).collect(Collectors.groupingBy(branchingredients::getBranchID, Collectors.counting()));
        ingredientCountByBranch.forEach((branchID, count) -> {
            String branchName = (String)branchesList.stream().filter((branch) -> branch.getBrandID() == branchID).map(Branches::getName).findFirst().orElse("Unknown Branch");
            System.out.printf("Branch: %s, Total Ingredients Updated: %d%n", branchName, count);
        });
    }

    static void Cau7() {
        System.out.println("Câu 7: Liệt kê các đơn hàng có giá trị lớn hơn 200,000 VND và trạng thái 'Đã hoàn thành' ");
        Stream var10000 = ordersList.stream().filter((order) -> order.getTotalAmount() >= 200000 && order.getStatus().equalsIgnoreCase("Đã hoàn thành"));
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }

    static void Cau8() {
        System.out.println("Câu 8: Tìm các sản phẩm có giá cao nhất trong từng danh mục");
        Map<String, Optional<menu>> maxPriceByCategory = (Map)menuList.stream().collect(Collectors.groupingBy(menu::getCategory, Collectors.maxBy(Comparator.comparingDouble(menu::getPrice))));
        maxPriceByCategory.forEach((category, product) -> product.ifPresent((p) -> System.out.printf("Category: %s, Product: %s, Price: %.2f%n", category, p.getName(), p.getPrice())));
    }

    static void Cau9() {
        System.out.println("Câu 9: Tính doanh thu trung bình mỗi ngày của từng chi nhánh trong tháng 12/2024");
        Map<Integer, Map<String, Double>> dailyRevenueByBranch = (Map)ordersList.stream().filter((order) -> order.getOrderDate().startsWith("2024-12")).collect(Collectors.groupingBy(orders::getBranchID, Collectors.groupingBy((order) -> order.getOrderDate(), Collectors.summingDouble(orders::getTotalAmount))));
        dailyRevenueByBranch.forEach((branchID, dailyRevenue) -> {
            String branchName = (String)branchesList.stream().filter((branch) -> branch.getBrandID() == branchID).map(Branches::getName).findFirst().orElse("Unknown Branch");
            double avgRevenue = dailyRevenue.values().stream().mapToDouble(Double::doubleValue).average().orElse((double)0.0F);
            System.out.printf("Branch: %s, Average Daily Revenue: %.2f%n", branchName, avgRevenue);
        });
    }

    static void Cau10() {
        System.out.println("Câu 10: Liệt kê các chi nhánh có từ 2 nhân viên trở lên");
        Stream var10000 = branchesList.stream().filter((branch) -> employeesList.stream().filter((emp) -> emp.getBranchID() == branch.getBrandID()).count() >= 2L);
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }

    static void Cau11() {
        System.out.println("Câu 11: Liệt kê các khách hàng đã mua ít nhất 2 sản phẩm khác nhau trong một đơn hàng");
        ordersList.stream().filter((order) -> orderdetailsList.stream().filter((od) -> od.getOrderID() == order.getOrderID()).map(orderdetails::getMenuID).distinct().count() >= 2L).forEach((order) -> {
            customers customer = (customers)customersList.stream().filter((cust) -> cust.getCustomerID() == order.getCustomerID()).findFirst().orElse(new customers(0, "Unknown Customer", "Unknown Phone Number", 0));
            System.out.println(customer);
        });
    }

    static void Cau12() {
        System.out.println("Câu 12: Tìm các chi nhánh có ít nhất 2 nguyên liệu gần hết ");
        ((Map)branchingredientsList.stream().collect(Collectors.groupingBy(branchingredients::getBranchID, Collectors.counting()))).forEach((branchID, count) -> {
            if (count >= 2L) {
                String branchName = (String)branchesList.stream().filter((branch) -> branch.getBrandID() == branchID).map(Branches::getName).findFirst().orElse("Unknown Branch");
                System.out.printf("Branch: %s, Total Ingredients Running Out: %d%n", branchName, count);
            }

        });
    }

    static void Cau13() {
        System.out.println("Câu 13: Tìm các sản phẩm được bán chạy nhất trong từng chi nhánh");
        Map<Integer, Map<Integer, Long>> productCountByBranch = (Map)orderdetailsList.stream().collect(Collectors.groupingBy((od) -> (Integer)ordersList.stream().filter((order) -> order.getOrderID() == od.getOrderID()).map(orders::getBranchID).findFirst().orElse(0), Collectors.groupingBy(orderdetails::getMenuID, Collectors.summingLong(orderdetails::getQuantity))));
        productCountByBranch.forEach((branchID, productCount) -> {
            String branchName = (String)branchesList.stream().filter((branch) -> branch.getBrandID() == branchID).map(Branches::getName).findFirst().orElse("Unknown Branch");
            System.out.printf("Branch: %s%n", branchName);
            productCount.entrySet().stream().max(Entry.comparingByValue()).ifPresent((entry) -> {
                String productName = (String)menuList.stream().filter((product) -> product.getMenuID() == (Integer)entry.getKey()).map(menu::getName).findFirst().orElse("Unknown Product");
                System.out.printf(" - Best Selling Product: %s, Quantity: %d%n", productName, entry.getValue());
            });
        });
    }

    static void Cau14() {
        System.out.println("Câu 14: Tìm tất cả các chi nhánh không có đơn hàng nào trong tháng 12/2024");
        Set<Integer> branchIDsWithOrders = (Set)ordersList.stream().filter((order) -> order.getOrderDate().startsWith("2024-12")).map(orders::getBranchID).collect(Collectors.toSet());
        Stream var10000 = branchesList.stream().filter((branch) -> !branchIDsWithOrders.contains(branch.getBrandID()));
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }

    static void Cau15() {
        System.out.println("Câu 15: Tìm ca làm việc được phân công cho nhiều nhân viên nhất trong tháng 12/2024");
        Map<Integer, Long> shiftCount = (Map)empshiftsList.stream().filter((es) -> es.getWorkDate().startsWith("2024-12")).collect(Collectors.groupingBy(employeeshifts::getShiftID, Collectors.counting()));
        shiftCount.entrySet().stream().max(Entry.comparingByValue()).ifPresent((entry) -> {
            String shiftName = (String)shiftsList.stream().filter((shift) -> shift.getShiftID() == (Integer)entry.getKey()).map(shifts::getShiftName).findFirst().orElse("Unknown Shift");
            System.out.printf("Shift: %s, Employee Count: %d%n", shiftName, entry.getValue());
        });
    }

    static void Cau16() {
        System.out.println("Câu 16: Tìm danh mục sản phẩm có tổng doanh thu cao nhất trong tháng 12/2024");
        Map<String, Double> revenueByCategory = (Map)orderdetailsList.stream().filter((od) -> ordersList.stream().anyMatch((order) -> order.getOrderID() == od.getOrderID() && order.getOrderDate().startsWith("2024-12"))).collect(Collectors.groupingBy((od) -> (String)menuList.stream().filter((menu) -> menu.getMenuID() == od.getMenuID()).map(menu::getCategory).findFirst().orElse("Unknown Category"), Collectors.summingDouble((od) -> (double)od.getQuantity() * (Double)menuList.stream().filter((menu) -> menu.getMenuID() == od.getMenuID()).map(menu::getPrice).findFirst().orElse((double)0.0F))));
        revenueByCategory.entrySet().stream().max(Entry.comparingByValue()).ifPresent((entry) -> System.out.printf("Category: %s, Total Revenue: %.2f%n", entry.getKey(), entry.getValue()));
    }

    static void Cau17() {
        System.out.println("Câu 17: Tìm nhân viên có tổng số ca làm việc nhiều nhất trong tháng 12/2024");
        Map<Integer, Long> shiftCountByEmployee = (Map)empshiftsList.stream().filter((es) -> es.getWorkDate().startsWith("2024-12")).collect(Collectors.groupingBy(employeeshifts::getEmployeeID, Collectors.counting()));
        shiftCountByEmployee.entrySet().stream().max(Entry.comparingByValue()).ifPresent((entry) -> {
            employees employee = (employees)employeesList.stream().filter((emp) -> emp.getEmployeeID() == (Integer)entry.getKey()).findFirst().orElse(new employees(0, "Unknown Employee", "Unknown Role", "Unknown Phone Number", "Unknown Salary", 0));
            System.out.printf("Employee: %s, Shift Count: %d%n", employee.getFullName(), entry.getValue());
        });
    }

    static void Cau18() {
        System.out.println("Câu 18: Tìm các sản phẩm được đặt hàng nhiều nhất trong tháng 12/2024");
        Map<Integer, Long> productCount = (Map)orderdetailsList.stream().filter((od) -> ordersList.stream().anyMatch((order) -> order.getOrderID() == od.getOrderID() && order.getOrderDate().startsWith("2024-12"))).collect(Collectors.groupingBy(orderdetails::getMenuID, Collectors.summingLong(orderdetails::getQuantity)));
        productCount.entrySet().stream().max(Entry.comparingByValue()).ifPresent((entry) -> {
            String productName = (String)menuList.stream().filter((menu) -> menu.getMenuID() == (Integer)entry.getKey()).map(menu::getName).findFirst().orElse("Unknown Product");
            System.out.printf("Product: %s, Quantity: %d%n", productName, entry.getValue());
        });
    }

    static void Cau19() {
        System.out.println("Câu 19: Tìm các sản phẩm được đặt hàng ít nhất trong tháng 12/2024");
        Map<Integer, Long> productCount = (Map)orderdetailsList.stream().filter((od) -> ordersList.stream().anyMatch((order) -> order.getOrderID() == od.getOrderID() && order.getOrderDate().startsWith("2024-12"))).collect(Collectors.groupingBy(orderdetails::getMenuID, Collectors.summingLong(orderdetails::getQuantity)));
        productCount.entrySet().stream().min(Entry.comparingByValue()).ifPresent((entry) -> {
            String productName = (String)menuList.stream().filter((menu) -> menu.getMenuID() == (Integer)entry.getKey()).map(menu::getName).findFirst().orElse("Unknown Product");
            System.out.printf("Product: %s, Quantity: %d%n", productName, entry.getValue());
        });
    }

    static void Cau20() {
        System.out.println("Câu 20: Liệt kê các sản phẩm không được đặt hàng trong tháng 12/2024");
        Set<Integer> productIDs = (Set)orderdetailsList.stream().filter((od) -> ordersList.stream().anyMatch((order) -> order.getOrderID() == od.getOrderID() && order.getOrderDate().startsWith("2024-12"))).map(orderdetails::getMenuID).collect(Collectors.toSet());
        Stream var10000 = menuList.stream().filter((menu) -> !productIDs.contains(menu.getMenuID()));
        PrintStream var10001 = System.out;
        Objects.requireNonNull(var10001);
        var10000.forEach(var10001::println);
    }
}
