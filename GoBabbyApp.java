import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;

public class GoBabbyApp {
    public static void main(String[] args) throws SQLException {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if (args.length > 0)
            tableName += args[0];
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = null;
        String your_password = null;
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, your_userid, your_password);
        Statement statement = con.createStatement();

        while (true) {
            // prompt for practitioner id
            Scanner sc = new Scanner(System.in);
            System.out.print("Please enter your practitioner id [E] to exit: ");
            String s = sc.next();
            int pid = 0;
            if (s.equals("E")) {
                statement.close();
                con.close();
                System.exit(0);
            } else pid = Integer.parseInt(s);

            // find the appointments
            boolean validid = false;
            String querySQL1 = "SELECT practid FROM midwives";
            java.sql.ResultSet rs1 = statement.executeQuery(querySQL1);
            while (rs1.next()) {
                int id = rs1.getInt(1);
                if (id == pid) {
                    validid = true;
                    break;
                }
            }
            if (!validid) {
                System.out.println("Entered id does not exist in the database.");
                continue;
            } else {
                // prompt for appointment date
                date:
                while (true) {
                    System.out.print("Please enter the date for appointment list [E] to exit: ");
                    String date = sc.next();
                    if (date.equals("E")) {
                        statement.close();
                        con.close();
                        System.exit(0);
                    } else {
                        String querySQL2 = "SELECT DISTINCT A.apttime, M.mname, M.hcnum, P.ppractid, P.cid, P.pregnum, A.aptid " +
                                "FROM midwives W, appointments A, pregnancies P, couples C, mothers M " +
                                "WHERE W.practid = A.practid AND A.cid = P.cid AND A.pregnum = P.pregnum AND P.cid = C.cid AND C.hcnum = M.hcnum " +
                                "AND A.aptdate = \'" + date + "\' AND A.practid = " + pid;
                        java.sql.ResultSet rs2 = statement.executeQuery(querySQL2);
                        String aptmts = "";
                        int rowCount = 0;
                        while (rs2.next()) {
                            rowCount++;
                            int idx = rs2.getRow();
                            Time time = rs2.getTime(1);
                            String mname = rs2.getString(2);
                            String hcnum = rs2.getString(3);
                            char isPrimary;
                            if (rs2.getInt(4) == pid) isPrimary = 'P';
                            else isPrimary = 'B';
                            aptmts += "\n"+ idx + ": " + isPrimary + " " + time + " " + mname + " " + hcnum;
                            idx++;
                        }
                        if (rowCount == 0) {
                            System.out.println("No appointments for the date entered.");
                            continue;
                        }

                        action:
                        while (true) {
                            System.out.println(aptmts);
                            // prompt for choice of appointment
                            System.out.println("Enter the appointment number that you would like to work on. [E] to exit [D] to go back to another date: ");
                            String s2 = sc.next();
                            if (s2.equals("E")) {
                                statement.close();
                                con.close();
                                System.exit(0);
                            }
                            if (s2.equals("D")) continue date;
                            int rowIdx = Integer.parseInt(s2);
                            rs2 = statement.executeQuery(querySQL2);
                            int cid;
                            int pregnum;
                            int aptid;
                            while (rs2.next()) {
                                if (rs2.getRow() == rowIdx) {
                                    cid = rs2.getInt(5);
                                    pregnum = rs2.getInt(6);
                                    aptid = rs2.getInt(7);
                                    ;
                                    String mname = rs2.getString(2);
                                    String hcnum = rs2.getString(3);

                                    while (true) {
                                        // prompt for choice of action
                                        System.out.println("\nFor " + mname + " " + hcnum);
                                        System.out.println("1. Review notes\n" +
                                                "2. Review tests\n" +
                                                "3. Add a note\n" +
                                                "4. Prescribe a test\n" +
                                                "5. Go back to the appointments.");
                                        System.out.println("Enter your choice: ");
                                        int cc = sc.nextInt();
                                        sc.nextLine();
                                        if (cc == 5) continue action;
                                        if (cc == 1) {
                                            String querySQL3 = "SELECT A.aptdate, N.tstamp, N.note" +
                                                    " FROM appointments A, notes N" +
                                                    " WHERE A.aptid = N.aptid AND A.cid =" + cid +
                                                    " AND A.pregnum = " + pregnum +
                                                    " ORDER BY aptdate DESC, apttime DESC";
                                            java.sql.ResultSet rs3 = statement.executeQuery(querySQL3);
                                            while (rs3.next()) {
                                                Date aptdate = rs3.getDate(1);
                                                Time tstamp = rs3.getTime(2);
                                                String note = rs3.getString(3);
                                                System.out.println(aptdate + " " + tstamp + " " + note);
                                            }
                                        }
                                        if (cc == 2) {
                                            String querySQL4 = "SELECT prescdate, ttype, results" +
                                                    " FROM tests" +
                                                    " WHERE cid = " + cid +
                                                    " AND pregnum = " + pregnum +
                                                    " ORDER BY prescdate DESC";
                                            java.sql.ResultSet rs4 = statement.executeQuery(querySQL4);
                                            while (rs4.next()) {
                                                Date testdate = rs4.getDate(1);
                                                String ttype = rs4.getString(2);
                                                String results = rs4.getString(3);
                                                System.out.println(testdate + " [" + ttype + "] " + results);
                                            }
                                        }
                                        if (cc == 3) {
                                            System.out.println("Please type your observation: ");
                                            String newnote = sc.nextLine();
                                            String insertSQL1 = String.format("INSERT INTO notes(aptid, tstamp, note) " +
                                                    "VALUES (%d, '%s', '%s')", aptid, new Timestamp(System.currentTimeMillis()), newnote);
                                            statement.executeUpdate(insertSQL1);
                                        }
                                        if (cc == 4) {
                                            System.out.println("Please enter the type of test: ");
                                            String ttype = sc.nextLine();
                                            Set<Integer> tids = new HashSet<>();
                                            String querySQL = "SELECT testid FROM tests";
                                            java.sql.ResultSet rs = statement.executeQuery(querySQL);
                                            while (rs.next()) {
                                                tids.add(rs.getInt(1));
                                            }
                                            int tid;
                                            do {
                                                tid = (new Random()).nextInt(9000) + 1000; // generate a four-digit test id
                                            } while (tids.contains(tid)); // check if tid is unique
                                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                            String curdate = LocalDate.now().format(formatter);
                                            String insertSQL2 = String.format("INSERT INTO tests(testid, ttype, results, techid, testdate, prescdate, sampldate, practid, pregnum, cid, babyid)" +
                                                    " VALUES (%d, '%s', NULL, NULL, NULL, '%s', '%s', %d, %d, %d, NULL)", tid, ttype, curdate, curdate, pid, pregnum, cid);
                                            statement.executeUpdate(insertSQL2);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
