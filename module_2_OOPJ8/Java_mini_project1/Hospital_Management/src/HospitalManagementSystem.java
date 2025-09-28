import java.sql.*;
import java.util.Scanner;

public class HospitalManagementSystem {

    private static final String URL = "jdbc:mysql://localhost:3306/hospital";
    private static final String USER = "root"; // Change this to your MySQL username
    private static final String PASSWORD = "atharva30"; // Change this to your MySQL password

    public static void main(String[] args) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Connected to the database!");

            Scanner scanner = new Scanner(System.in);
            while (true) {
                System.out.println("\nHospital Management System");
                System.out.println("1. Add Doctor");
                System.out.println("2. Add Patient");
                System.out.println("3. Book Appointment");
                System.out.println("4. View Doctors");
                System.out.println("5. View Patients");
                System.out.println("6. View Appointments");
                System.out.println("7. Exit");
                System.out.print("Enter your choice: ");

                int choice = scanner.nextInt();
                scanner.nextLine(); // Consume newline

                switch (choice) {
                    case 1:
                        addDoctor(connection, scanner);
                        break;
                    case 2:
                        addPatient(connection, scanner);
                        break;
                    case 3:
                        bookAppointment(connection, scanner);
                        break;
                    case 4:
                        viewDoctors(connection);
                        break;
                    case 5:
                        viewPatients(connection);
                        break;
                    case 6:
                        viewAppointments(connection);
                        break;
                    case 7:
                        System.out.println("Exiting...");
                        return;
                    default:
                        System.out.println("Invalid choice. Please try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void addDoctor(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter doctor's name: ");
        String name = scanner.nextLine();
        System.out.print("Enter doctor's specialization: ");
        String specialization = scanner.nextLine();

        String sql = "INSERT INTO doctors (name, specialization) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, specialization);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new doctor was added successfully!");
            }
        }
    }

    private static void addPatient(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter patient's name: ");
        String name = scanner.nextLine();
        System.out.print("Enter patient's age: ");
        int age = scanner.nextInt();
        scanner.nextLine(); // Consume newline
        System.out.print("Enter patient's gender: ");
        String gender = scanner.nextLine();

        String sql = "INSERT INTO patients (name, age, gender) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setInt(2, age);
            statement.setString(3, gender);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new patient was added successfully!");
            }
        }
    }

    private static void bookAppointment(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter patient ID: ");
        int patientId = scanner.nextInt();
        System.out.print("Enter doctor ID: ");
        int doctorId = scanner.nextInt();
        scanner.nextLine(); // Consume newline
        System.out.print("Enter appointment date (YYYY-MM-DD): ");
        String appointmentDate = scanner.nextLine();

        String sql = "INSERT INTO appointment (patient_id, doctor_id, appoinment_date) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, patientId);
            statement.setInt(2, doctorId);
            statement.setDate(3, Date.valueOf(appointmentDate));
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Appointment booked successfully!");
            }
        }
    }

    private static void viewDoctors(Connection connection) throws SQLException {
        String sql = "SELECT * FROM doctors";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            System.out.println("\n--- Doctors ---");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String specialization = resultSet.getString("specialization");
                System.out.printf("ID: %d, Name: %s, Specialization: %s\n", id, name, specialization);
            }
        }
    }

    private static void viewPatients(Connection connection) throws SQLException {
        String sql = "SELECT * FROM patients";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            System.out.println("\n--- Patients ---");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                System.out.printf("ID: %d, Name: %s, Age: %d, Gender: %s\n", id, name, age, gender);
            }
        }
    }

    private static void viewAppointments(Connection connection) throws SQLException {
        String sql = "SELECT a.id, p.name as patient_name, d.name as doctor_name, a.appoinment_date " +
                     "FROM appointment a " +
                     "JOIN patients p ON a.patient_id = p.id " +
                     "JOIN doctors d ON a.doctor_id = d.id";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            System.out.println("\n--- Appointments ---");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String patientName = resultSet.getString("patient_name");
                String doctorName = resultSet.getString("doctor_name");
                Date appointmentDate = resultSet.getDate("appoinment_date");
                System.out.printf("ID: %d, Patient: %s, Doctor: %s, Date: %s\n", id, patientName, doctorName, appointmentDate);
            }
        }
    }
}